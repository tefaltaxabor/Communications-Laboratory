function [output] = huffman_img(huffman_structure, img_width, img_height, encoded_seq)
	
    %vector
    o_v = source_decoding.huffman(huffman_structure,encoded_seq);
    %matrix 
    o_m = reshape(o_v,[ img_width, img_height])';
    for i = 1:img_height
        for j = 2:img_width
            o_m(i,j) = mod(o_m(i,j) + o_m(i,j-1), 256);
            %A_prev = img(i,j);
        end
    end
    output = o_m(:)';
end
