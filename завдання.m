clc
clear

% 1. Створення бази даних цифр (5x5 матриці)
Zero = [ 1  1  1  1  1;
         1 -1 -1 -1  1;
         1 -1 -1 -1  1;
         1 -1 -1 -1  1;
         1  1  1  1  1];

One = [-1 -1  1 -1 -1;
       -1 -1  1 -1 -1;
       -1 -1  1 -1 -1;
       -1 -1  1 -1 -1;
       -1 -1  1 -1 -1];

Two = [ 1  1  1  1  1;
       -1 -1 -1 -1  1;
        1  1  1  1  1;
        1 -1 -1 -1 -1;
        1  1  1  1  1];

Three = [ 1  1  1  1  1;
         -1 -1 -1 -1  1;
          1  1  1  1  1;
         -1 -1 -1 -1  1;
          1  1  1  1  1];

Four = [ 1 -1 -1 -1  1;
         1 -1 -1 -1  1;
         1  1  1  1  1;
        -1 -1 -1 -1  1;
        -1 -1 -1 -1  1];

Five = [ 1  1  1  1  1;
         1 -1 -1 -1 -1;
         1  1  1  1  1;
        -1 -1 -1 -1  1;
         1  1  1  1  1];

Six = [  1  1  1  1  1;
         1 -1 -1 -1 -1;
         1  1  1  1  1;
         1 -1 -1 -1  1;
         1  1  1  1  1];

Seven = [1  1  1  1  1;
        -1 -1 -1 -1  1;
        -1 -1 -1  1 -1;
        -1 -1  1 -1 -1;
        -1  1 -1 -1 -1];

Eight = [1  1  1  1  1;
         1 -1 -1 -1  1;
         1  1  1  1  1;
         1 -1 -1 -1  1;
         1  1  1  1  1];

Nine = [ 1  1  1  1  1;
         1 -1 -1 -1  1;
         1  1  1  1  1;
        -1 -1 -1 -1  1;
        -1 -1 -1 -1  1];

% 2. Відображення еталонних цифр
figure(1);
hold on; % Додано hold on
subplot(2,5,1); imagesc(Zero); title('Stored 0');
subplot(2,5,2); imagesc(One); title('Stored 1');
subplot(2,5,3); imagesc(Two); title('Stored 2');
subplot(2,5,4); imagesc(Three); title('Stored 3');
subplot(2,5,5); imagesc(Four); title('Stored 4');
subplot(2,5,6); imagesc(Five); title('Stored 5');
subplot(2,5,7); imagesc(Six); title('Stored 6');
subplot(2,5,8); imagesc(Seven); title('Stored 7');
subplot(2,5,9); imagesc(Eight); title('Stored 8');
subplot(2,5,10); imagesc(Nine); title('Stored 9');
hold off; % Додано hold off

% 3. Ініціалізація матриць для обчислень
% Формування матриці V, де кожен стовпець - це розгорнута в вектор матриця цифри
V = [Zero(:) One(:) Two(:) Three(:) Four(:) Five(:) Six(:) Seven(:) Eight(:) Nine(:)]; % [cite: 21]

alpha = 0.8; % [cite: 21]
iter = 10;   % [cite: 21]

% 4. Обчислення вагової матриці W
W = V*V'; % [cite: 21]
W = W - diag(diag(W)); % Обнулення діагональних елементів [cite: 21]

% 5. Створення випадкового вхідного образу та його розгортання у вектор
x = sign(2*rand(5,5)-1); % Створення випадкової матриці 5x5 з елементами 1 або -1 [cite: 22]
x = reshape(x, 25,1);   % Розгортання матриці у вектор-стовпець [cite: 22]

% 6. Ітераційний процес розпізнавання
figure(2);
for k = 1:iter % [cite: 23]
    x_reshaped = reshape(x,5,5); % Зміна форми для відображення [cite: 23]
    subplot(2,5,k); % Відображення на кожній ітерації (можна змінити на 1,iter,k або 3,5,k як в документі)
    imagesc(x_reshaped); % Відображення поточного стану образу
    title(['Iteration: ' num2str(k)]);
    drawnow; % Оновити фігуру негайно

    x = reshape(x, 25,1); % Повернення до форми вектора для обчислень [cite: 23]

    xtemp = alpha*W*x; % [cite: 23]

    for j = 1:25 % [cite: 24]
        if xtemp(j)>0
            x(j)=1;
        else
            x(j)=-1;
        end % [cite: 24]
    end
end

% Відображення фінального розпізнаного образу
figure(3);
imagesc(reshape(x,5,5));
title('Final Recognized Pattern');

disp('Процес розпізнавання завершено.');
disp('У Figure 1 показані еталонні образи цифр.');
disp('У Figure 2 показані ітерації процесу розпізнавання.');
disp('У Figure 3 показаний фінальний розпізнаний образ.');