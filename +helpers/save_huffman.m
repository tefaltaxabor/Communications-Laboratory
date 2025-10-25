
function save_huffman()
    M = [0 1 2];
    pM = [0.27 0.46 0.27];
    B = 1;
    huffman_dms = helpers.create_huffman(M, pM, B);
    if ~exist('files','dir'), mkdir('files'); end
    save(fullfile('files','huffman_dms.mat'), 'huffman_dms');
end