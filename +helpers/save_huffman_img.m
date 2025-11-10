function save_huffmam_img()
    param.source.type = 'image';
    param.source.filename = 'files/lena.pgm';
    param = source.initialize(param); % i n i t s o u r c e
    output_path = 'huffman_img.mat';
    img = reshape(param.source.sequence, ...
        [param.source.image.width, param.source.image.height ])';
    img_rec = img;
    %suponiendo q img size(img) = N(zeilen) x M(columns);
    %s = size(img);
    for i = 1:param.source.image.height
        A_prev = double(img(i,1));
        img_rec(i,1) = uint8(A_prev);
        for j = 2:param.source.image.width
            A_curr = double(img(i,j));
            A_dach = mod(A_curr - A_prev,256);            
            img_rec(i,j) = uint8(A_dach);
            A_prev = A_curr;
        end
    end
    
    %create empirical distribution of the img
    bytes = uint8(img_rec(:));
    
    %stosi
    
    counts = accumarray(double(bytes)+1, 1, [256 1]);
    %counts = counts;
    prob = counts / sum(counts);
    
    %save huffman structure
    
    alphabet = uint8(0:255)';
    
    %B = 1
    
    huffman_structure = helpers.create_huffman(alphabet,prob,1);
    huffman_structure.type = 'img';
    save(fullfile('files',output_path), 'huffman_structure');
end