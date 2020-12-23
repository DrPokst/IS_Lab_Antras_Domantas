%% 1 dalis duomenų mokymui paruošimas

% ivestis 
x = 0.1:1/22:1;
%
d = (1 + 0.6 * sin(2 * pi * x / 0.7)) + ((0.3 * sin(2 * pi * x)) / 2);

%Mokymo žingsnis
lr = 0.3;

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


for i = 1:20
    
  % 2.2 skaičiuojame 1 sluoksnio išėjimus
    %2.2.1 pirmo sluoksnio išėjimo skaičiavimas
    v11=x(1)*w11+b11;
    v21=x(1)*w21+b21;
    v31=x(1)*w31+b31;
    v41=x(1)*w41+b41;
    v51=x(1)*w51+b51;
    
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
end