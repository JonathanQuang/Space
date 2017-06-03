// Clyde "Thluffy" Sinclair
// APCS2 pd0
// HW35 -- searching, calc height, count leaves in BST
// 2017-05-05

/*****************************************************
 * class BST
 * Implementation of the BINARY SEARCH TREE abstract data type (ADT) 
 * A BST maintains the invariant that, for any node N with value V, 
 * L<V && V<R, where L and R are node values in N's left and right
 * subtrees, respectively.
 * (Any value in a node's left subtree must be less than its value, 
 *  and any value in its right subtree must be greater.)
 * This BST only holds ints (its nodes have int cargo)
 *****************************************************/

public class BST 
{
    //instance variables / attributes of a BST:
    TreeNode _root;
 

    /*****************************************************
     * default constructor
     * Initializes an empty tree.
     *****************************************************/
    BST( ) {
  _root = null;
    }


    /*****************************************************
     * void insert( int ) 
     * Adds a new data element to the tree at appropriate location.
     *****************************************************/
    public void insert( EnemyShip newVal ) 
    {
  TreeNode newNode = new TreeNode( newVal );

  if ( _root == null ) {
       _root = newNode;
      return;
  }
        insert( _root, newNode );
    }
    //recursive helper for insert(int)
    public void insert( TreeNode stRoot, TreeNode newNode ) {

  if ( newNode.getValue() < stRoot.getValue() ) {
      //if no left child, make newNode the left child
      if ( stRoot.getLeft() == null )
    stRoot.setLeft( newNode );
      else //recurse down left subtree
    insert( stRoot.getLeft(), newNode );
      return;
  }
  else { // new val >= curr, so look down right subtree
      //if no right child, make newNode the right child
      if ( stRoot.getRight() == null )
    stRoot.setRight( newNode );
      else //recurse down right subtree
    insert( stRoot.getRight(), newNode );
      return;
  }
    }

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //~~~~~~~~~~~~~v~~TRAVERSALS~~v~~~~~~~~~~~~~~~~~~~~~

    // each traversal should simply print to standard out 
    // the nodes visited, in order

    //process root, recurse left, recurse right
    public void preOrderTrav() 
    {
  preOrderTrav( _root );
    }
    public void preOrderTrav( TreeNode currNode ) {
  if ( currNode == null )
      return;
  System.out.print( currNode.getValue() + " " );
  preOrderTrav( currNode.getLeft() );
  preOrderTrav( currNode.getRight() );
    }

    //recurse left, process root, recurse right
    public void inOrderTrav() 
    {
  inOrderTrav( _root );
    }
    public void inOrderTrav( TreeNode currNode ) {
  if ( currNode == null )
      return;
  inOrderTrav( currNode.getLeft() );
  System.out.print( currNode.getValue() + " " );
  inOrderTrav( currNode.getRight() );
    }

    //recurse left, recurse right, process root
    public void postOrderTrav() 
    {
  postOrderTrav( _root );
    }
    public void postOrderTrav( TreeNode currNode ) {
  if ( currNode == null )
      return;
  postOrderTrav( currNode.getLeft() );
  postOrderTrav( currNode.getRight() );
  System.out.print( currNode.getValue() + " "  );
    }
    //~~~~~~~~~~~~~^~~TRAVERSALS~~^~~~~~~~~~~~~~~~~~~~~~
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



    /*****************************************************
     * TreeNode search(int)
     * returns pointer to node containing target,
     * or null if target not found
     *****************************************************/
    TreeNode search( EnemyShip target )
    {
  return search( target, _root );
    }
    TreeNode search( EnemyShip target, TreeNode currNode )
    {
  if ( currNode==null || currNode.getValue()==target.money )
      return currNode;
  else if ( target.money < currNode.getValue() )
      return search( target, currNode.getLeft() );
  else if ( target.money > currNode.getValue() )
      return search( target, currNode.getRight() );
  else
      return null; //to get past compiler
    }


    /*****************************************************
     * int height()
     * returns height of this tree (length of longest leaf-to-root path)
     * eg: a 1-node tree has height 1
     *****************************************************/
    public int height()
    {
  return height( _root );
    }
    //recursive helper for height()
    public int height( TreeNode currNode )
    {
  if ( currNode==null ) //Q: Why cannot use .equals() ?
      return 0;
  if ( isLeaf(currNode) )
      return 1;
  else //height is 1 for this node + height of deepest subtree
      return 1 + Math.max( height(currNode.getLeft()),
         height(currNode.getRight()) );
    }




    /*****************************************************
     * int numLeaves()
     * returns number of leaves in tree
     *****************************************************/
    public int numLeaves()
    {
  return numLeaves( _root );
    }
    public int numLeaves( TreeNode currNode ) { 
  int foo = 0;
  if ( currNode == null )
      return 0;
  foo += numLeaves( currNode.getLeft() );
  if ( isLeaf(currNode) )
      foo++;
  foo += numLeaves( currNode.getRight() );
  return foo;
    }



    //~~~~~~~~~~~~~v~~MISC.HELPERS~~v~~~~~~~~~~~~~~~~~~~
    public boolean isLeaf( TreeNode node ) { 
  return ( node.getLeft() == null && node.getRight() == null );
    }
    //~~~~~~~~~~~~~^~~MISC.HELPERS~~^~~~~~~~~~~~~~~~~~~~


    //main method for testing
/*
public static void main( String[] args ) 
    {
  BST arbol = new BST();

  arbol.insert( 4 );
  arbol.insert( 2 );
  arbol.insert( 5 );
  arbol.insert( 6 );
  arbol.insert( 1 );
  arbol.insert( 3 );

  System.out.println( "\npre-order traversal:" );
  arbol.preOrderTrav();
  //expected:
  // 4 2 1 3 5 6 

  System.out.println( "\nin-order traversal:" );
  arbol.inOrderTrav();
  //expected:
  // 1 2 3 4 5 6 
  
  System.out.println( "\npost-order traversal:" );
  arbol.postOrderTrav();  
  //expected:
  // 1 3 2 6 5 4

  /*~~~~~~~~~~~~move~me~down~~~~~~~~~~~~~~~~~~~~~~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    //}//end main
    

}//end class