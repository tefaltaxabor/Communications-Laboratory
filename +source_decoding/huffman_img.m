function [output] = huffman_img(huffman_structure, img_width, img_height, encoded_seq)
	
    %vector
    o_v = source_decoding.huffman(huffman_structure,encoded_seq);
    %matrix 
    o_m = reshape(o_v,[ img_height, img_width]);
    o_rev = o_m;
    for i = 1:img_height
        for j = 2:img_width
            o_rev(i,j) = mod(double(o_rev(i,j-1)) + double(o_m(i,j)), 256);
        end
    end
    o_rev = uint8(o_rev);
    imshow(o_rev)
    output = reshape(o_rev.', 1, []); 
end




