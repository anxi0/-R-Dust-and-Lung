#반복문에 필요한 함수 지정
sum=0
checkdiff=0
hr=0
sum=0
View(v)
v<-c()
for(i in 1:nrow(dat)){
  #만약 날짜가 다르면 그날의 미세먼지 총량에 시간을 나눠 벡터로 넣고 sum과 hr를 초기화 
  if(as.numeric(substr(dat[i,2],10,10))!=checkdiff){ #xxxx-xx-xy의 y값으로 날짜를 구분해 검증
    if(substr(dat[i,2],12,13)!="00"){
      print(as.character(dat[i-1,2]))
      print(as.character(dat[i,2]))
      print(sum)
      print(hr)
      }
    v[length(v)+1]<-sum/hr
    sum=0
    hr=0
    
  }
  checkdiff=as.numeric(substr(dat[i,2],10,10)) #숫자형태로 날짜 검증 부분을 슬라이스
  hr=hr+1 #1시간 추가
  sum=sum+dat[i,3] #해당시간의 농도 추가
}
length(v)
View(v)
length(v)
plot(v,type="l")
