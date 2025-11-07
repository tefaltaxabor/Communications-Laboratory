function save_huffmam_statistic(text_path)
    output_path = 'huffman_text.mat';
    %create empirical distribution of the text
    txt = fileread(text_path);
    bytes = uint8(txt(:));
    %stosi
    counts = accumarray(double(bytes)+ 1, 1, [256 1]);
    %used = find(counts > 0);                 % índices en 1..256
    %prob = counts(used) / sum(counts(used)); % probs solo de usados
    %alphabet = char(uint8(used - 1)).';      % bytes reales 0..255

    prob = counts / sum(counts);
    %save huffman structure
    alphabet = char(uint8(0:255)).';

   

    %B = 1
    huffman_structure = helpers.create_huffman(alphabet,prob,1);
    save(fullfile('files',output_path), 'huffman_structure');
end

