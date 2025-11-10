function [output] = huffman_img(huffman_structure, img_width, img_height, input_seq)
    
    img = reshape ( input_seq , ...
        [ img_width, img_height ] )';
    img_rec = img;
    %s = size(img);
    for i = 1:img_height
        A_prev = double(img(i,1));
        img_rec(i,1) = uint8(A_prev);
        for j = 2:img_width
            A_curr = double(img(i,j));
            A_dach = mod(A_curr - A_prev,256);
            img_rec(i,j) = uint8(A_dach);
            A_prev = A_curr;  % actualizar con el valor original
        end
    end
    diff_seq = uint8(img_rec(:))';
    output = source_encoding.huffman(huffman_structure,diff_seq);
end

%img_width = 512;
%img_height = 512;
%encoded_seq = huffman_img(huffman_structure,img_width,img_height,d);