function save_huffmam_img()
    param.source.type = 'image';
    param.source.filename = 'files/lena.pgm';
    param = source.initialize(param); % i n i t s o u r c e
    output_path = 'huffman_img.mat';

    img = reshape(param.source.sequence, ...
        [param.source.image.width, param.source.image.height ])';
    
    %suponiendo q img size(img) = N(zeilen) x M(columns);
    s = size(img);
    for i = 1:s(1)
        A_prev = img(i,1);
        for j = 2:s(2)
            A_dach = mod(img(i,j) - A_prev,256);
            A_prev = img(i,j);
            img(i,j) = A_dach;
        end
    end
    
    %create empirical distribution of the img
    
    txt = fileread(text_path);
    bytes = uint8(txt(:));
    
    %stosi
    
    counts = accumarray(double(bytes)+1, 1, [256 1]);
    counts = counts + 1;
    prob = counts / sum(counts);
    
    %save huffman structure
    
    alphabet = char(uint8(0:255))';
    
    %B = 1
    
    huffman_structure = helpers.create_huffman(alphabet,prob,1);
    save(fullfile('files',output_path), 'huffman_structure');

end