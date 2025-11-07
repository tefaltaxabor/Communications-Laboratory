function [output] = huffman_img(huffman_structure, img_width, img_height, input_seq)
    
    img = reshape ( input_seq , ...
        [ img_width, img_height ] )';
    %s = size(img);
    for i = 1:img_height
        A_prev = img(i,1);
        for j = 2:img_width
            A_dach = mod(img(i,j) - A_prev,256);
            A_prev = img(i,j);
            img(i,j) = A_dach;
        end
    end
    diff_seq = uint8(img(:));
    output = source_encoding.huffman(huffman_structure,diff_seq);
end