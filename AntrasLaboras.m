%% kintamųjų aspirašymas

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

%%