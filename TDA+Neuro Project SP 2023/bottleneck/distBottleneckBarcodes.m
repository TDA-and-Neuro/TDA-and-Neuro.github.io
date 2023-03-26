function dB = distBottleneckBarcodes(bX,bY)
 % Facundo Memoli 2012

 % compute distance matrix
 [f,bXo,bYo] = distBarcode(bX,bY);
 
 % now solve for best matching
 [im jm dB] = bottleneck(f);
