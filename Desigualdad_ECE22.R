library(readxl) #para cargar datos de excel con código
library(dplyr) #para manipular la base de datos y generar estadísticas 


base=(readxl::read_xlsx("U:/EncuestaContinuadeEmpleo2022/Desigualdad.xlsx"))
Hom=base%>%select(`Ingreso por persona neto`,H)%>%filter(H!="-")
Hom$H=as.numeric(Hom$H)
Muj=base%>%select(`Ingreso por persona neto`,M)%>%filter(M!="-")
Muj$M=as.numeric(Muj$M)
Tot=base%>%select(`Ingreso por persona neto`,"Total")%>%filter(Total!="-")


d=as.dataframe(Tot)
cbind(quantile(d[[1]],c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1),type=6))
cbind(quantile(d[[2]],c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1),type=6))

b=as.vector(Muj)
cbind(quantile(b[[1]],c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1),type=6))

c=as.vector(Hom)
cbind(quantile(c[[1]],c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1),type=6))