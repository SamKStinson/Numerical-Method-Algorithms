function[L,U,P,invM]=luFactor(A)
%Algorithm for LU factorization of square matricies with inverse as
%optional output
%L=Lower triangular matrix
%U=Upper triangular matrix
%P=Pivot matrix
%invA=Inverse matrix of A before pivot
%m=number of rows in A
%n=number of columns in A

[m,n]=size(A);
%Evaluating size of matrix
if n>m
    error('A must be square')
elseif m>n
%     error('A must be square')
    P=eye(m);
    L=eye(m,n);
    m=n;
else
    P=eye(n);
    L=eye(n);
end
%defining U as A while ignoring excess rows
i=1:n;
j=1:n;
U(i,j)=A(i,j);

for i=1:m-1 
%   Pivoting U and P
%   x=row of maximum value
    [~,x]=max(abs(U(i:n,i)));
    x=x+i-1;
    if x~=i
        tempU=U(i,:);
        U(i,:)=U(x,:);
        U(x,:)=tempU;
        
        tempP=P(i,:);
        P(i,:)=P(x,:);
        P(x,:)=tempP;
    end
    
    %Forward substitution for L and U
    L1=U(i+1:m,i)/U(i,i);
    U(i+1:m,:)=U(i+1:m,:)-(L1*U(i,:));
    L(i+1:m,i)=L1;
    
    %Pivoting L
    if i>=2
        tempL=L(i,1:i-1);
        L(i,1:i-1)=L(x,1:i-1);
        L(x,1:i-1)=tempL;
    end
end
%Initalizing inverse matrix, identity matrix, and intermediate matrix
invM=zeros(m);
I=eye(m);
d=zeros(m);
%solves for intermediate matrix and then the inverse matrix
for j=1:m
    d(:,j)=L\I(:,j);
    invM(:,j)=U\d(:,j);    
end
%pivots the inverse matrix to match original A
invM=invM*P;
end