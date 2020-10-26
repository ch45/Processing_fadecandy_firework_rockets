
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

void saveData(ArrayList<LaunchControl> cntrlData, String filename) {

  if (cntrlData.size() == 0 || filename == "") {
    return;
  }

  Table table = new Table();

  table.addColumn("duration");
  table.addColumn("deck position min");
  table.addColumn("deck position max");
  table.addColumn("launch angle");
  table.addColumn("launch velocity min");
  table.addColumn("launch velocity max");
  table.addColumn("number to launch");
  table.addColumn("hue");
  table.addColumn("number explodees");

  for (LaunchControl cntrl: cntrlData) {
    TableRow row = table.addRow();
    row.setInt("duration",cntrl.durationMilliS);
    row.setInt("deck position min",cntrl.deckPosMin);
    row.setInt("deck position max",cntrl.deckPosMax);
    row.setInt("launch angle",cntrl.launchAngle);
    row.setInt("launch velocity min",cntrl.launchVelMin);
    row.setInt("launch velocity max",cntrl.launchVelMax);
    row.setInt("number to launch",cntrl.numLauched);
    row.setInt("hue",cntrl.hue);
    row.setInt("number explodees",cntrl.numExplodees);
  }

  try {
    saveTable(table, filename);
  } catch(Exception e) {
    // fall through
  }
}

ArrayList<LaunchControl> loadData(String filename) {

  if (filename == "") {
    return getSimpleSeq();
  }

  ArrayList<LaunchControl> cntrlData = new ArrayList<LaunchControl>();
  Table table = new Table();

  try {
    table = loadTable(filename, "header");
  } catch(Exception e) {
    table = new Table();
  }

  if (table != null) {
    for (TableRow row : table.rows()) {
      int durationMilliS = row.getInt("duration");
      int deckPosMin = row.getInt("deck position min");
      int deckPosMax = row.getInt("deck position max");
      int launchAngle = row.getInt("launch angle");
      int launchVelMin = row.getInt("launch velocity min");
      int launchVelMax = row.getInt("launch velocity max");
      int numLauched = row.getInt("number to launch");
      int hue = row.getInt("hue");
      int numExplodees = row.getInt("number explodees");
      cntrlData.add(new LaunchControl(durationMilliS, deckPosMin, deckPosMax, launchAngle, launchVelMin, launchVelMax, numLauched, hue, numExplodees));
    }
  }

  return (cntrlData.size() >0) ? cntrlData : getSimpleSeq();
}

ArrayList<LaunchControl> getSimpleSeq() {
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
  cntrlData = new ArrayList<LaunchControl>();
  cntrlData.add(new LaunchControl(2000, 0, 100, 90, 50, 100, 0, -1, 50));

  return cntrlData;
}
