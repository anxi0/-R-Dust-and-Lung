regions=c("108 SE","143 DG","152 US","156 GJ")
year=2018
for(l in 1:4){
  wd="C:/Users/jjo01/Desktop/BigData/"
  wd=paste0(wd,regions[l])
  setwd(wd) #�۾����� ����
  file<-paste0(year,".csv")
  dat<-read.csv(file=file,nrows=9000) #�޾ƿ� �� ����
  names(dat)<-c("region","time","ppm") #�̸� ����
#plot(dat)
#dim(dat)
  dat$ppm <- ifelse(is.na(dat$ppm), mean(dat$ppm, na.rm=T), dat$ppm) #����ġ�� ������ �����͵��� ��հ����� ġȯ
#table(is.na(dat)) #����ġ�� �ִ��� Ȯ��
#plot(dat[,3],type="p")
#�ݺ����� �ʿ��� �Լ� ����
  hr=0
  checkdiff=0
  sum=0
  res<-c()

#��¥ ���ڿ� �����̽����� �ݺ����� �̿��� �Ϻ� ��հ� ���ϱ�
  for(i in 1:nrow(dat)){
    date=substr(dat[i,2],10,10)

    if(date!=checkdiff){#xx-xx-xy�� y�� ���� ����
      res[length(res)+1]=sum/hr#���� �ٸ��� �Ϸ絥����(����/������ �ð�) �Է�
      checkdiff=date #�Ǵٸ� ���е� �� �߰�
      hr=0 #���� �ð� �ʱ�ȭ
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

