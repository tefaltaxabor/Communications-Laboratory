function save_huffman()
    M = uint8([0 1 2]);
    pM = [0.27 0.46 0.27];
    B = 1;
    huffman_structure = helpers.create_huffman(M, pM, B);
    huffman_structure.type = 'dms';
    if ~exist('files','dir'), mkdir('files'); end
    save(fullfile('files','huffman_dms.mat'), 'huffman_structure');
end