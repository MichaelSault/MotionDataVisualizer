String[] test = loadStrings("2FeetJump001.bvh");
String[] translate;
String[] [] moveArray = new String[2575][78];
int start = 0;

println("there are " + test.length + " lines");

for (int i = 0; i < test.length; i++) {
  if (test[i].equals("MOTION")){
    start = i + 3;
    println("found");
    //println(test[i+3]);
    break;
  }
  println(i);
}

for (int k = 0; k < (test.length)-start; k++){
  translate = split(test[start+k], ' ');
  for (int j = 0; j < translate.length-1; j++){
    moveArray[k][j] = translate[j];
  }
}

println(moveArray[2574]);
println(moveArray[2574][77]);
