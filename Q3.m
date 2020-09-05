clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;

one=imread('./letters_numbers/1.tif');  two=imread('./letters_numbers/2.tif');
three=imread('./letters_numbers/3.tif');four=imread('./letters_numbers/4.tif');
five=imread('./letters_numbers/5.tif'); six=imread('./letters_numbers/6.tif');
seven=imread('./letters_numbers/7.tif');eight=imread('./letters_numbers/8.tif');
nine=imread('./letters_numbers/9.bmp'); zero=imread('./letters_numbers/0.tif');
patterns=[one, two, three, four, five, six, seven, eight, zero];

dataset_path = './Dataset/';
d = dir(dataset_path);
imgs = [];
labels = [];
precision = 0;
for i=1:numel(d)
    if d(i).isdir == 0
        %I = imread([dataset_path d(i).name]);
        %imgs = [imgs, I];
        ans = CalculateSum([dataset_path d(i).name], patterns);
        if i == 101 || i == 61
            if ans == (str2num(d(i).name(end-4:end-4)))
                precision = precision + 1;
            end
        else
            if ans == (str2num(d(i).name(end-5:end-4)))
               precision = precision + 1;
            end
        end
        I = imread([dataset_path d(i).name]);
        RGB = insertText(I, [330 990], num2str(ans), 'BoxColor', 'white', 'FontSize', 24, 'TextColor', 'red');
        imwrite(RGB, ['./answers/' d(i).name])
    end
end

precision/100

    