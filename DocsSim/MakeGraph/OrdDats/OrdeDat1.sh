#!/bin/bash                                                                                                                             
a=`wc FilePru.txt | awk '{print $1*0.2}'` #count the number of lines in the file FilePru.txt                                            
j=-3;
j1=0;
rm OrdeDatTmp1.txt
rm OrdeDatTmp2.txt
rm Datos1.txt
rm Datos2.txt
rm Datos3.txt
rm unoTmp1.txt
rm unoTmp2.txt
for i in {1..60}
do
echo $((j=j+4));
echo ----- $((j1=j1+4))
sed -n "$i"p FilePru.txt | awk '{print $1}' >> unoTmp1.txt #save the firts column of FilePru.txt in unoTmp1.txt                         
sed -n "$i"p FilePru.txt | awk '{print $2}' >> unoTmp2.txt #save the second column of FilePru.txt in unoTmp2.txt                        

uno=`sed -n "$j"p FilePru.txt` #asign to uno the j-th line in the file FilePrue.txt                                                     


echo $uno >> Datos1.txt

dos=`sed -n "$j1"p FilePru.txt`
echo $dos >> OrdeDatTmp2.txt
done
echo SegundaParte




for i1 in {1..60}
do
unoa=`sed -n "$i1"p unoTmp1.txt`
unob=`sed -n "$i1"p unoTmp2.txt`
#echo __________________________                                                                                                        
#echo $unob                                                                                                                             
#echo ----------------------------------                                                                                                

if [[ "$unob" == "eV" ]]; then
 echo $unoa >> Datos1.txt
echo primero
fi

if [[ "$unob" == "KeV" ]]; then
 factor1=00
echo $unoa$factor1 >> Datos1.txt
echo segundo
fi

if [[ "$unob" == "MeV" ]]; then
 factor2=000000
echo $unoa$factor2 >> Datos1.txt
echo tercero
fi

echo __________________________
echo $factor
echo ---- $unob
#ent=$(($unoa ))                                                                                                                        
#echo $ent >> Datos1.txt                                                                                                                

#echo ----------------------------------                                                                                                


sed -n "$i1"p OrdeDatTmp2.txt | awk '{print $2}' >> Datos2.txt
sed -n "$i1"p OrdeDatTmp2.txt | awk '{print $4}' >> Datos3.txt
done

#rm Datos4.txt                                                                                                                          
for i2 in {1..50}
do
uno=`sed -n "$i2"p Datos1.txt`
dos=`sed -n "$i2"p Datos2.txt`
tres=`sed -n "$i2"p Datos3.txt`
echo $uno $dos $tres >> DatsOrderedSeve19.txt
done

rm Datos1.txt
rm Datos2.txt
rm Datos3.txt
rm OrdeDatTmp2.txt
rm unoTmp1.txt
rm unoTmp2.txt

