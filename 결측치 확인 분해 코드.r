#�ݺ����� �ʿ��� �Լ� ����
sum=0
checkdiff=0
hr=0
sum=0
View(v)
v<-c()
for(i in 1:nrow(dat)){
  #���� ��¥�� �ٸ��� �׳��� �̼����� �ѷ��� �ð��� ���� ���ͷ� �ְ� sum�� hr�� �ʱ�ȭ 
  if(as.numeric(substr(dat[i,2],10,10))!=checkdiff){ #xxxx-xx-xy�� y������ ��¥�� ������ ����
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
  checkdiff=as.numeric(substr(dat[i,2],10,10)) #�������·� ��¥ ���� �κ��� �����̽�
  hr=hr+1 #1�ð� �߰�
  sum=sum+dat[i,3] #�ش�ð��� �� �߰�
}
length(v)
View(v)
length(v)
plot(v,type="l")
