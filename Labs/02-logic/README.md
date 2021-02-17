# Assignment 2
Link to this [Assignment](https://github.com/ondrasouk/Digital-electronics-1/tree/main/Labs/02-logic)  
Link to [top of repository](https://github.com/ondrasouk/Digital-electronics-1)
## Preparation
Binary comparator:
### Truth table
| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 0 | 0 0 | 0 | 1 | 0 |
| 1 | 0 0 | 0 1 | 0 | 0 | 1 |
| 2 | 0 0 | 1 0 | 0 | 0 | 1 |
| 3 | 0 0 | 1 1 | 0 | 0 | 1 |
| 4 | 0 1 | 0 0 | 1 | 0 | 0 |
| 5 | 0 1 | 0 1 | 0 | 1 | 0 |
| 6 | 0 1 | 1 0 | 0 | 0 | 1 |
| 7 | 0 1 | 1 1 | 0 | 0 | 1 |
| 8 | 1 0 | 0 0 | 1 | 0 | 0 |
| 9 | 1 0 | 0 1 | 1 | 0 | 0 |
| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
| 11 | 1 0 | 1 1 | 0 | 0 | 1 |
| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
| 14 | 1 1 | 1 0 | 1 | 0 | 0 |
| 15 | 1 1 | 1 1 | 0 | 1 | 0 |

equals<sub>SoP</sub> = B&#862;<sub>1</sub>B&#862;<sub>0</sub>A&#862;<sub>1</sub>A&#862;<sub>0</sub>+B&#862;<sub>1</sub>B<sub>0</sub>A&#862;<sub>1</sub>A<sub>0</sub>+B<sub>1</sub>B&#862;<sub>0</sub>A<sub>1</sub>A&#862;<sub>0</sub>+B<sub>1</sub>B<sub>0</sub>A<sub>1</sub>A<sub>0</sub>

less<sub>PoS</sub> = (B<sub>1</sub>+B<sub>0</sub>+A<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B<sub>1</sub>+B&#862;<sub>0</sub>+A<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B<sub>1</sub>+B&#862;<sub>0</sub>+A<sub>1</sub>+A&#862;<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B<sub>0</sub>+A<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B<sub>0</sub>+A<sub>1</sub>+A&#862;<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B<sub>0</sub>+A&#862;<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B&#862;<sub>0</sub>+A<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B&#862;<sub>0</sub>+A<sub>1</sub>+A&#862;<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B&#862;<sub>0</sub>+A&#862;<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B&#862;<sub>0</sub>+A&#862;<sub>1</sub>+A&#862;<sub>0</sub>)
