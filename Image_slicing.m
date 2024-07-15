% Define the input and output file paths
inputFile = 'C:\Users\JAHANGIR\Downloads\fakes001000.png';
outputFolder = 'C:\Users\JAHANGIR\Downloads\Sliced output';

% Read the input image
img = imread(inputFile);

% Get the size of the image
[imgHeight, imgWidth, numChannels] = size(img);

% Define the tile size
tileSize = 512;

% Calculate the number of tiles needed along each dimension
numTilesX = ceil(imgWidth / tileSize);
numTilesY = ceil(imgHeight / tileSize);

% Create the output folder if it does not exist
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Slice the image into tiles
for y = 1:numTilesY
    for x = 1:numTilesX
        % Calculate the coordinates of the current tile
        xStart = (x-1) * tileSize + 1;
        xEnd = min(x * tileSize, imgWidth);
        yStart = (y-1) * tileSize + 1;
        yEnd = min(y * tileSize, imgHeight);
        
        % Extract the tile from the image
        tile = img(yStart:yEnd, xStart:xEnd, :);
        
        % Generate the output file name
        outputFileName = sprintf('tile_%d_%d.png', y, x);
        outputFile = fullfile(outputFolder, outputFileName);
        
        % Write the tile to the output file
        imwrite(tile, outputFile);
    end
end

disp('Image slicing complete.');
