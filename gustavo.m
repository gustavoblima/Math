function y = gustavo(w)
%[ output_args ] = Untitled( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%[n m]= size(X)
%[o p]= size(w)
for i=1:1
    for j=1:1
y=w(i,j)+(alpha*(X(i,j)-w(i,j)))
%w(1,2)=w(1,2)+(alpha*(X(1,2)-w(1,2)))
    end
end          

end

