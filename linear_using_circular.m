% Input sequences
x = [1 2 3];
h = [4 5 6];

% Length needed for linear convolution
N = length(x) + length(h) - 1;

% Zero-pad both sequences to length N
x_padded = [x, zeros(1, N - length(x))];
h_padded = [h, zeros(1, N - length(h))];
%h_padded = [zeros(1, N - length(h)), h];

% Circular convolution using cconv
%y_cconv = cconv(x_padded, h_padded, N);
xr= [x_padded(1),fliplr(x_padded(2:end))];

for k=1:N
xrm= circshift(xr, 0:k-1);
y_cconv(k)= sum(xrm.*h_padded);
disp(xrm);
disp(y_cconv(k));
end
% Linear convolution for comparison
y_linear = conv(x, h);

% Display both
disp('Linear convolution using conv():');
disp(y_linear);

disp('Linear convolution using cconv() with zero-padding:');
disp(y_cconv);
