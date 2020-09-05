function out = CalculateSum(img_path, patterns)
Image = imread(img_path);
Image = medfilt2(Image, [5, 5]);    
Image = Image(2:968, 2:968);
binaryImage = ~imbinarize(Image);

props = regionprops(binaryImage, 'BoundingBox');
out = 0;
for k = 1 : length(props)
	thisBB = props(k).BoundingBox;
	croppedImage{k} = imcrop(binaryImage, thisBB);
    cropped = imresize(croppedImage{k}, [42 24]);
    res = [];
    for i = 1:9
        im = patterns(:, (i-1)*24+1 : i*24);
        res = [res, psnr(uint8(im), uint8(cropped))];
    end
    [val, idx] = max(res, [], 2);
    if idx == 9
        idx = 0;
    end
    out = out + idx;
end
end 