
database = 'Multiple_Regg_database.xlsx' ;
X_bar = xlsread (database,'B2:C20'); 
Y = xlsread (database, 'A2:A20');

ones_clm_1 = ones(size(X_bar,1), 1); 
X = [ones_clm_1 , X_bar] ;

Bita = zeros(size(X,2),1); 

X_T_X = (X') * (X);
X_T_Y = (X') * (Y);

Bita = inv(X_T_X) * X_T_Y; 

Y_hat = X * Bita; 

figure()
scatter3(X_bar(:,1) ,X_bar(:,2) ,Y, 'r') 
xlabel('parameter 1');
ylabel('parameter 2');
zlabel('Output');

hold on


[p q] = meshgrid(-1:1:700) % Generate x and y data
z = -1*Bita(2,1)*p - 1* Bita(3,1)*q -Bita(1,1) % Solve for z data
surf(p,q,z) %Plot the surface

