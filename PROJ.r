regions=c("108 SE","143 DG","152 US","156 GJ")
year=2018
for(l in 1:4){
  wd="C:/Users/jjo01/Desktop/BigData/"
  wd=paste0(wd,regions[l])
  setwd(wd) #작업폴더 지정
  file<-paste0(year,".csv")
  dat<-read.csv(file=file,nrows=9000) #받아올 열 지정
  names(dat)<-c("region","time","ppm") #이름 지정
#plot(dat)
#dim(dat)
  dat$ppm <- ifelse(is.na(dat$ppm), mean(dat$ppm, na.rm=T), dat$ppm) #결측치를 나머지 데이터들의 평균값으로 치환
#table(is.na(dat)) #결측치가 있는지 확인
#plot(dat[,3],type="p")
#반복문에 필요한 함수 지정
  hr=0
  checkdiff=0
  sum=0
  res<-c()

#날짜 문자열 슬라이싱으로 반복문을 이용해 일별 평균값 구하기
  for(i in 1:nrow(dat)){
    date=substr(dat[i,2],10,10)

    if(date!=checkdiff){#xx-xx-xy의 y로 날을 구분
      res[length(res)+1]=sum/hr#날이 다르면 하루데이터(총합/측정된 시간) 입력
      checkdiff=date #또다른 구분된 날 추가
      hr=0 #측정 시간 초기화
      sum=0
    } else {
      hr=hr+1
      sum=sum+dat[i,3]
      print(hr)
      print(sum)
    }
  }
  list(res)
  name<-paste0(regions[l]," ",year,".png")
  png(filename=name,width=1500,height=2000)
  plot(res,type="l")
  dev.off()
}

