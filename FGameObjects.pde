class FGameObject extends FBox {

  FGameObject(int w, int h) {
    super(w, h);//2 by 2 block so be carefull when using super on other things
  }
  
  FGameObject() {
    super(gridSize*2/1.3, gridSize*2);//2 by 2 block so be carefull when using super on other things
  }

  void act() {
  }

  boolean isTouching(String n) {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains(n)) {
        return true  ;
      }
    }
    return false;
  }
}
