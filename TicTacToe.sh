#! /bin/bash

reset(){
  echo "====================="
  echo "Created by davidhcefx"
  echo "2017.4.4"
  echo "TicTacToe game in bash"
  echo "Wrintten in Ubuntu-XFCE desktop environment"
  Arr=(. . . . . . . . .)
  player=1
  gamestatus=1
  echo "====================="
  echo "Game started"
}

set(){
  idx=$(( $1 * 3 + $2 ))
  if [ ${Arr[$idx]} == "." ]; then 
    Arr[$idx]=$3
    player=$((player%2+1))
  else
    echo "You can't place there!"
  fi
}

print(){
  echo "c\r 0 1 2"
  echo "0   ${Arr[0]} ${Arr[3]} ${Arr[6]}"
  echo "1   ${Arr[1]} ${Arr[4]} ${Arr[7]}"
  echo "2   ${Arr[2]} ${Arr[5]} ${Arr[8]}"
}

checkmatch(){
  if [ ${Arr[$1]} != "." ] && [ ${Arr[$1]} == ${Arr[$2]} ] && [ ${Arr[$2]} == ${Arr[$3]} ]; then
    gamestatus=0
  fi
  counter=0
  flag=0
    echo "${counter}"
  while [ $counter -gt 9 ]; do
    if [ ${Arr[${counter}]} == "." ]; then
      flag=1
    fi
    counter=$counter+1
  done
  if [ $flag -eq 0 ]; then
    gamestatus=2
  fi
}

checkgame(){
  checkmatch 0 1 2
  checkmatch 3 4 5
  checkmatch 6 7 8
  checkmatch 0 3 6
  checkmatch 1 4 7
  checkmatch 2 5 8
  checkmatch 0 4 8
  checkmatch 2 4 6
}


reset
 # infinit game loop
while [ 1 == 1 ]; do
  echo ""
  if [ $player == 1 ]; then 
    sym=O
  else 
    sym=X; 
  fi
  echo "Player $player's turn: ($sym)"
  print
  echo ""
  echo "  Command:"
  echo "	1. set [row] [column]"
  echo "	2. restart"
  while [ 1 == 1 ]; do
    read -r cmd a b
    if [ $cmd == "set" ]; then
  	  set $a $b $sym
	    break
    elif [ $cmd == "restart" ]; then
	    reset
	    break
    else
	    echo "wrong command, try again."
    fi
  done
  checkgame
  if [ $gamestatus != 1 ]; then
    echo "Gameover"
    player=$((player%2+1))
    echo "Player $player ($sym) win!!"
    while [ 1 == 1 ]; do
    	read -r cmd n
    	if [ $cmd == "restart" ]; then
	      reset
	      break
    	fi
    done
    if [ $gamestatus == 2 ]; then
      echo "Fucking Draw !"
      while [ 1 == 1 ]; do
    	  read -r cmd n
    	  if [ $cmd == "restart" ]; then
	        reset
	        break
    	  fi
      done
    fi
  fi
  
done

