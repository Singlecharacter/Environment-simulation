class Cell
{
  float maxNutrients;
  
  float nutrientA;
  float nutrientB;
  float nutrientC;  
  
  Cell()
  {
    maxNutrients = random(3,5);
    
    float firstGen = random(maxNutrients);
    float secondGen = random(maxNutrients - firstGen);
    float thirdGen = random(maxNutrients - (firstGen + secondGen));
    
    nutrientA = firstGen;
    nutrientB = secondGen;
    nutrientC = thirdGen;
  }
  
  int ToAlphaValue(float nutrient)
  {
    float returnHolder = 256 * nutrient;
    return round(returnHolder / maxNutrients);
  }
  
  float TotalNutrients()
  {
    return nutrientA + nutrientB + nutrientC;
  }
  
  boolean isOverflowing()
  {
    return maxNutrients < TotalNutrients();
  }
  
  void Grow()
  {
    int holder = int(random(1000));
    
    if(holder == 4)
    {
      if(TotalNutrients() <= maxNutrients)
      {
        if (nutrientA > nutrientB && nutrientA > nutrientC)
        {
          nutrientA = nutrientA + (nutrientA * .5);
        }
        else if (nutrientB > nutrientA && nutrientB > nutrientC)
        {
          nutrientB = nutrientB + (nutrientB * .5);
        }
        else if (nutrientC > nutrientB && nutrientC > nutrientA)
        {
          nutrientC = nutrientC + (nutrientC * .5);
        }
      }
    }
  }
}