int n = 100;
int[] arr = new int[n];
void setup()
{
  for(int i = 0;i<n;i++)
  {
    arr[i]=i;
  }
  randomize();
  size(1000,500);
  frameRate(10000);
  draw();
}
void randomize()
{
  int counter = n*10;
  while(counter-->0)
  {
    int firstRandom = (int)random(0,n);
    int secondRandom = (int)random(0,n);
    int aux = arr[firstRandom];
    arr[firstRandom] = arr[secondRandom];
    arr[secondRandom]=aux;
  }
}
int i=0,j=1;
void bubbleSort()
{
    if(i>n-2)
    return;
  if(j>=n-i){
    i++;
    j=1;
  }

  if(arr[j-1]>arr[j])
  {
    int aux = arr[j-1];
    arr[j-1] = arr[j];
    arr[j]=aux;
  }
  j++;
}
void selectionSort()
{
  if(i==n-1)
    return;
  int indexMin=0,minim=100000;
  for(int index = i;index<n;index++)
  {
    if(arr[index]<minim)
    {
      minim = arr[index];
      indexMin = index;
    }
  }
    int aux = arr[i];
    arr[i] = arr[indexMin];
    arr[indexMin]=aux;
    i++;
    j = indexMin;
}
void countSort()
{
  if(i==n-1)
    i=0;
  int indexOfNew=0;
  for(int parc = 0;parc<n;parc++)
  {
    if(arr[i]>arr[parc])
      indexOfNew++;
  }
  j = indexOfNew;
  int aux = arr[i];
  arr[i] = arr[j];
  arr[j]=aux;
  i++;
}
boolean firstTime = true;
void draw()
{
  if(firstTime)
  {
    background(0);
    for(int i = 0;i<n;i++)
    {
      fill(255,0,0);
      rect(i*(1000/n),500-arr[i]*(500/n),1000/n,arr[i]*(500/n));
    }
    firstTime = false;
  }
  bubbleSort();
  int first=j-2,second=j-1;
  fill(0,0,0);
  rect((first)*(1000/n),0,(1000/n),500);
  rect((second)*(1000/n),0,(1000/n),500);
  fill(255,0,0);
  if(i!=n){
  rect((first)*(1000/n),500-arr[first]*(500/n),1000/n,arr[first]*(500/n));
  rect((second)*(1000/n),500-arr[second]*(500/n),1000/n,arr[second]*(500/n));
  }
  //delay(2);
}
//For bubble    first = j-2, second = j-1
//For selection first = i-1, second = j
