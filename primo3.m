% Entradas
n = input('¿Cuántos números primos usar?: ');
L = input('¿Longitud de la contraseña?: ');

rand('seed', sum(100*clock));

% Generar primos
contador = 0;
num = 2;
primos = [];

while contador < n
  es_primo = 1;

  for i = 2:sqrt(num)
    if mod(num, i) == 0
      es_primo = 0;
      break;
    endif
  endfor

  if es_primo == 1
    primos = [primos num];
    contador = contador + 1;
  endif

  num = num + 1;
endwhile

% Conjuntos de caracteres
mayus = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
minus = 'abcdefghijklmnopqrstuvwxyz';
numeros = '0123456789';
simbolos = '!@#$%^&*';

todos = [mayus minus numeros simbolos];

password = '';

% --- Garantizar seguridad mínima ---
password = [password mayus(randi(length(mayus)))];
password = [password minus(randi(length(minus)))];
password = [password numeros(randi(length(numeros)))];
password = [password simbolos(randi(length(simbolos)))];

% --- Completar usando primos ---
i = 1;
while length(password) < L

  idx = mod(primos(i), length(todos)) + 1;
  password = [password todos(idx)];

  i = i + 1;
  if i > length(primos)
    i = 1;
  endif

endwhile

% Mezclar completamente
password = password(randperm(length(password)));

% Mostrar resultado
disp('----------------------------');
disp('Contraseña segura generada:');
disp(password);
disp('----------------------------');
