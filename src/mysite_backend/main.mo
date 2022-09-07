import Int "mo:base/Int";
import Array "mo:base/Array";

actor {

  func sortByHelper(xs : [var Int], l : Int, r : Int){
    var i = l;
    var j = r;
    var swap = xs[0];
    let pivot = xs[Int.abs(l + r) / 2];

    if(l < r){
      while(i <= j){
        while(xs[Int.abs(i)] < pivot){
          i += 1;
        };
        while(xs[Int.abs(j)] > pivot){
          j -= 1;
        };
        if(i <= j){
          swap := xs[Int.abs(i)];
          xs[Int.abs(i)] := xs[Int.abs(j)];
          xs[Int.abs(j)] := swap;
          i += 1;
          j -= 1;
        }
      };

      if( 1 < j){
        sortByHelper(xs, l, j);
      };
      if( i < r){
        sortByHelper(xs, i, r);
      };
    };
  };

  func quicksort(arr : [var Int]) {
    sortByHelper(arr, 0, arr.size() - 1);
  };

  public func qsort(arr : [Int]) : async [Int] {

    let result = Array.thaw<Int>(arr);
    quicksort(result);
    return Array.freeze<Int>(result);
  }
};