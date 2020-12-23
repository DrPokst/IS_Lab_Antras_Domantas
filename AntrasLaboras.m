%% 1 dalis duomenų mokymui paruošimas
clear all; close all;
% ivestis 
x = 0.1:1/22:1;
%
d = (1 + 0.6 * sin(2 * pi * x / 0.7)) + ((0.3 * sin(2 * pi * x)) / 2);

%Mokymo žingsnis
lr = 0.3;
%mokymu skaičius
ms = 2000000;



%Priskiriamos atsitiktines W ir b reikšmės

%Pirmo sluoksnio svoriai
w11 = rand(1);
w21 = rand(1);
w31 = rand(1);
w41 = rand(1);
w51 = rand(1);
%Pirmo sluoksnios bias
b11 = rand(1);
b21 = rand(1);
b31 = rand(1);
b41 = rand(1);
b51 = rand(1);
%ANtro sluoksnio svoriai
w12 = rand(1);
w22 = rand(1);
w32 = rand(1);
w42 = rand(1);
w52 = rand(1);
%Antro sluoksnio bias
b12 = rand(1);

%% 2 dalis Skaičiuojame tinklo atsaką

for a = 1:ms
    for i = 1:20
    
  % 2.2 skaičiuojame 1 sluoksnio išėjimus
    %2.2.1 pirmo sluoksnio išėjimo skaičiavimas
    v11=x(i)*w11+b11;
    v21=x(i)*w21+b21;
    v31=x(i)*w31+b31;
    v41=x(i)*w41+b41;
    v51=x(i)*w51+b51;
    
    %2.2.2 Pritaikome aktyvacijos funkciją
    y11 = 1/(1+exp(-v11));
    y21 = 1/(1+exp(-v21));
    y31 = 1/(1+exp(-v31));
    y41 = 1/(1+exp(-v41));
    y51 = 1/(1+exp(-v51));
    
  % 2.3 skaičiuojame 2 sluoksnio išėjimus
     y = y11*w12+y21*w22+y31*w32+y41*w42+y51*w52+b12;
  % 2.4 suskaičiuojame klaidą
     e = d(i) - y;
     del_out = e;
  % 3 Atnaujiname koeficientus 
    %3.1 
    %w = w + lr * del * yin
     w12 = w12 + lr * del_out * y11;
     w22 = w22 + lr * del_out * y21;
     w32 = w32 + lr * del_out * y31;
     w42 = w42 + lr * del_out * y41;
     w52 = w52 + lr * del_out * y51;

     b12 = b12 + lr * del_out; 
         
    del1 = y11 * (1 - y11) * del_out * w12;
    del2 = y21 * (1 - y21) * del_out * w22;
    del3 = y31 * (1 - y31) * del_out * w32;
    del4 = y41 * (1 - y41) * del_out * w42;
    del5 = y51 * (1 - y51) * del_out * w52;
    
    w11 = w11 + lr * del1 * x(i);
    w21 = w21 + lr * del2 * x(i);
    w31 = w31 + lr * del3 * x(i);
    w41 = w41 + lr * del4 * x(i);
    w51 = w51 + lr * del5 * x(i);

    b11 = b11 + lr * del1;
    b21 = b21 + lr * del2;
    b31 = b31 + lr * del3;
    b41 = b41 + lr * del4;
    b51 = b51 + lr * del5;
    
    end
    
end

%Patikrinimui suskaičiuojame kekvieno įvesties taško išėjima y su jau apmokytai svoriais
for i = 1:20
    
    v11 = x(i) * w11 + b11;      
    v21 = x(i) * w21 + b21;    
    v31 = x(i) * w31 + b31;    
    v41 = x(i) * w41 + b41;    
    v51 = x(i) * w51 + b51;    
    
    y11 = 1 / (1 + (exp(-v11)));  
    y21 = 1 / (1 + (exp(-v21)));  
    y31 = 1 / (1 + (exp(-v31)));   
    y41 = 1 / (1 + (exp(-v41)));   
    y51 = 1 / (1 + (exp(-v51)));   

    %išvesties paskaičiacimas
    y(i) = y11*w12 + y21*w22 + y31*w32 + y41*w42 + y51*w52 + b12;
end

figure(1);
plot(x, d, 'x', x, y, 'o');
legend('Realaus signalo taškai','Aproksimuoto panaudojant NN')