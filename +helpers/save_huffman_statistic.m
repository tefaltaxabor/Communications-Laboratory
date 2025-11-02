function save_huffmam_statistic(text_path)
    output_path = 'files/huffman_text.mat';
    %create empirical distribution of the text
    txt = fileread(text_path);
    bytes = uint8(txt(:));
    %stosi
    counts = accumarray(double(bytes)+1, 1, [256 1]);
    counts = counts + 1;
    prob = counts / sum(counts);
    %save huffman structure
    alphabet = uint8(0:255).';
    %B = 1
    huffman_structure = helpers.create_huffman(alphabet,prob,1);
    save(fullfile('files','huffman_text.mat'), 'huffman_structure');
end