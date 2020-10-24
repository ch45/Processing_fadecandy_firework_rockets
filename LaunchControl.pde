
  /*
   * [duration] fireworks sequence (milliseconds), 0 = add to previous
   * [deck position min] 0 - 100% (left to right)
   * [deck position max] 0 - 100%, different values gives random min to max
   * [launch angle] 0 - 180 degrees, -1 = random 60 to 120
   * [launch velocity min] 0 - 100%
   * [launch velocity max] 0 - 100%, different values gives random min to max
   * [number to launch] N, -1, 0 = random 1 to 8
   * [hue] colour wheel 0 - 360, -1 = random 0 to 359
   * [number explodees] 50 - 500
   */

class LaunchControl {
  public int durationMilliS;
  public int deckPosMin;
  public int deckPosMax;
  public int launchAngle;
  public int launchVelMin;
  public int launchVelMax;
  public int numLauched;
  public int hue;
  public int numExplodees;

  LaunchControl(int d, int dmin, int dmax, int a, int lmin, int lmax, int nl, int h, int ne) {
    durationMilliS = d;
    deckPosMin = dmin;
    deckPosMax = dmax;
    launchAngle = a;
    launchVelMin = lmin;
    launchVelMax = lmax;
    numLauched = nl;
    hue = h;
    numExplodees = ne;
  }

  void dump() {
    println(String.format("%6d,%4d,%4d,%4d,%4d,%4d,%2d,%4d,%4d", durationMilliS, deckPosMin, deckPosMax, launchAngle, launchVelMin, launchVelMax, numLauched, hue, numExplodees));
  }
}

