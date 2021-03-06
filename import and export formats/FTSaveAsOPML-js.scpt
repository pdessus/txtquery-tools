JsOsaDAS1.001.00bplist00�Vscripto� f u n c t i o n   r u n ( )   { 
 	 ' u s e   s t r i c t ' ; 
 	 / *   j s h i n t   m u l t i s t r :   t r u e   * / 
 	 v a r   p T i t l e   =   " F T   s a v e   a s   O P M L " , 
 	 	 p V e r   =   " 0 . 5 " , 
 	 	 p A u t h o r   =   " R o b   T r e w " , 
 	 	 p S i t e   =   " h t t p s : / / g i t h u b . c o m / R o b T r e w / t x t q u e r y - t o o l s " , 
 	 	 p C o m m e n t   =   " \ 
 	 	 	 -   P r e s e r v e s   t h e   F o l d i n g T e x t   o u t l i n i n g   e x p a n s i o n   s t a t e   i n   t h e   O P M L . \ 
 	 	 	 -   F o l d i n g T e x t   @ k e y ( v a l u e )   p a i r s   b e c o m e   O P M L   a t t r i b u t e s   w i t h   s t r i n g   v a l u e s \ 
 	 	 	 -   F o l d i n g T e x t   @ t a g s   w i t h   n o   v a l u e  !�   O P M L   a t t r i b u t e s   w i t h   v a l u e   1 \ 
 	 	 	 -   e a c h   < o u t l i n e >   i n c l u d e s   a   t e x t S t a r t   p r o p e r t y   ( o f f s e t   i n t o   F T   f i l e ) \ 
 	 	 " , 
 	 	 p b l n D e b u g   =   0 ; 
 
 	 v a r   a p p S A   =   A p p l i c a t i o n . c u r r e n t A p p l i c a t i o n ( ) ; 
 	 a p p S A . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 
 
 	 / / O P T I O N S :   
 
 	 / / E x p o r t   t h e   w h o l e   d o c u m e n t ,   o r   j u s t   t h e   s u b t r e e ( s )   o f   a n y   s e l e c t e d   l i n e ( s )   ? 
 	 v a r   p b l n W h o l e D o c   =   t r u e ; 
 
 	 / /   D e f a u l t   f o l d e r   f o r   S a v e   A s   d i a l o g   ? 
 	 / / v a r   p O u t F o l d e r   =   a p p S A . p a t h T o ( ' d e s k t o p ' ) ; 
 	 v a r   p O u t F o l d e r   =   n u l l ; 
 	 / /   o r   e . g .     
 	 / /   	 v a r   p O u t F o l d e r = P a t h ( " / U s e r s / h o u t h a k k e r / d o c s " ) 
 
 
 	 / /   F o l d i n g T e x t   c o d e 	 ( t o   b e   p a s s e d   a s   s t r i n g ,   w i t h   o p t i o n s ,   t o   F T . e v a l u a t e ( )   . . . ) 	 
 	 v a r   f n S c r i p t   = 
 	 	 f u n c t i o n   ( e d i t o r ,   o p t i o n s )   { 
 	 	 	 / /   F o l d i n g T e x t   c o d e   h e r e 
 
 	 	 	 / /   F I N D   T H E   R O O T   N O D E S   A M O N G   T H E   S E L E C T E D   L I N E S 
 	 	 	 / /   ( I g n o r i n g   a n y   c h i l d r e n   o f   l i n e s   a l r e a d y   s e e n ) 
 	 	 	 f u n c t i o n   s e l e c t e d R o o t s ( )   { 
 	 	 	 	 v a r   l s t R o o t s   =   [ ] , 
 	 	 	 	 	 l s t S e e n   =   [ ] ; 
 
 	 	 	 	 e d i t o r . s e l e c t e d R a n g e ( ) . f o r E a c h N o d e I n R a n g e ( f u n c t i o n   ( o N o d e )   { 
 	 	 	 	 	 i f   ( o N o d e . t y p e ( )   ! = =   ' e m p t y ' )   { 
 	 	 	 	 	 	 i f   ( l s t S e e n . i n d e x O f ( o N o d e . p a r e n t . i d )   = = =   - 1 )   l s t R o o t s . p u s h ( o N o d e ) ; 
 	 	 	 	 	 	 l s t S e e n . p u s h ( o N o d e . i d ) ; 
 	 	 	 	 	 } 
 	 	 	 	 } ) ; 
 	 	 	 	 r e t u r n   l s t R o o t s ; 
 	 	 	 } 
 
 	 	 	 / /   I n t e r m e d i a t e   J S O   f o r m a t   u s e d   i n   v a r i o u s   s c r i p t s 
 	 	 	 / /   n o d e N e s t ( l s t N o d e s )   [ F T N o d e ]  !�   [ { t e x t : s t r T e x t ,   n e s t : [ < r e c u r s i v e > ,   ,   ] } , f o l d ] 
 	 	 	 f u n c t i o n   t e x t N e s t ( l s t N o d e s ,   o P a r e n t )   { 
 	 	 	 	 v a r   l s t N e s t   =   [ ] , 
 	 	 	 	 	 l s t K e y s ,   d c t K e y V a l , 
 	 	 	 	 	 d c t N o d e ,   o N o d e ,   d c t T a g s ,   s t r K e y ,   k ; 
 
 	 	 	 	 f o r   ( v a r   i   =   0 ,   l n g   =   l s t N o d e s . l e n g t h ;   i   <   l n g ;   i + + )   { 
 	 	 	 	 	 o N o d e   =   l s t N o d e s [ i ] ; 
 	 	 	 	 	 i f   ( o N o d e . t y p e ( )   ! = =   ' e m p t y ' )   { 
 	 	 	 	 	 	 d c t N o d e   =   { 
 	 	 	 	 	 	 	 t e x t :   o N o d e . t e x t ( ) , 
 	 	 	 	 	 	 	 p o s n :   o N o d e . l i n e T e x t S t a r t ( ) , 
 	 	 	 	 	 	 	 t y p e :   o N o d e . t y p e ( ) , 
 	 	 	 	 	 	 	 p a r e n t :   o P a r e n t 
 	 	 	 	 	 	 } ; 
 
 	 	 	 	 	 	 d c t T a g s   =   o N o d e . t a g s ( ) ; 
 	 	 	 	 	 	 f o r   ( k   i n   d c t T a g s )   {   / /   i e   o n l y   i f   o b j e c t   n o t   e m p t y 
 	 	 	 	 	 	 	 d c t N o d e . t a g s   =   d c t T a g s ; 
 	 	 	 	 	 	 	 b r e a k ;   / /   o n e   t e s t   o n l y   -   n o   l o o p 
 	 	 	 	 	 	 } 
 
 	 	 	 	 	 	 i f   ( o N o d e . h a s C h i l d r e n ( ) )   { 
 	 	 	 	 	 	 	 d c t N o d e . f o l d   =   e d i t o r . i s C o l l a p s e d ( o N o d e ) ; 
 	 	 	 	 	 	 	 d c t N o d e . n e s t   =   t e x t N e s t ( o N o d e . c h i l d r e n ( ) ,   o N o d e ) ; 
 	 	 	 	 	 	 } 
 	 	 	 	 	 	 l s t N e s t . p u s h ( d c t N o d e ) ; 
 	 	 	 	 	 } 
 	 	 	 	 } 
 	 	 	 	 r e t u r n   l s t N e s t ; 
 	 	 	 } 
 
 
 	 	 	 / /   T R A N S L A T E   A   S E T   O F   R O O T S   A N D   T H E I R   D E S C E N D A N T S   I N T O   O P M L 
 	 	 	 / /   I n p u t   f o r m a t   [ { t e x t : ' ' ,   n e s t : [ < r e c u r s i v e > ] ,   t a g s : { } ,   f o l d : f a l s e } ] 
 	 	 	 f u n c t i o n   o p m l T r a n s l a t i o n ( l s t R o o t s ,   s t r T i t l e )   { 
 
 	 	 	 	 v a r   l s t O P M L H e a d   =   [ 
 	 	 	 	 	 	 ' < ? x m l   v e r s i o n = \ " 1 . 0 \ "   e n c o d i n g = \ " u t f - 8 \ " ? > ' , 
 	 	 	 	 	 	 ' < o p m l   v e r s i o n = \ " 1 . 0 \ " > ' , 
 	 	 	 	 	 	 '     < h e a d > ' , 
 	 	 	 	 	 	 '         < t i t l e > '   +   s t r T i t l e   +   ' < / t i t l e > ' , 
 	 	 	 	 	 	 '         < e x p a n s i o n S t a t e > ' 
 	 	 	 	 	 ] , 
 	 	 	 	 	 l s t O P M L P o s t E x p a n d   =   [ 
 	 	 	 	 	 	 ' < / e x p a n s i o n S t a t e > ' , 
 	 	 	 	 	 	 '     < / h e a d > ' , 
 	 	 	 	 	 	 '     < b o d y > \ n ' 
 	 	 	 	 	 ] , 
 	 	 	 	 	 l s t O P M L T a i l   =   [ 
 	 	 	 	 	 	 '     < / b o d y > ' , 
 	 	 	 	 	 	 ' < / o p m l > ' 
 	 	 	 	 	 ] , 
 	 	 	 	 	 s t r N o d e S t a r t   =   ' < o u t l i n e   t e x t = \ " ' , 
 	 	 	 	 	 s t r L e a f C l o s e   =   ' / > \ n ' , 
 	 	 	 	 	 s t r P a r e n t C l o s e   =   ' > \ n ' , 
 	 	 	 	 	 s t r O u t l i n e C l o s e   =   ' < / o u t l i n e > \ n ' , 
 	 	 	 	 	 s t r H e a d   =   l s t O P M L H e a d . j o i n ( ' \ n ' ) , 
 	 	 	 	 	 s t r T a i l   =   l s t O P M L T a i l . j o i n ( ' \ n ' ) , 
 	 	 	 	 	 s t r O u t l i n e   =   ' ' , 
 	 	 	 	 	 s t r O P M L ,   l s t O P M L , 
 	 	 	 	 	 l n g R o o t s   =   l s t R o o t s . l e n g t h , 
 	 	 	 	 	 i , 
 	 	 	 	 	 l s t F o l d s   =   [ ] , 
 	 	 	 	 	 i L i n e   =   0 ; 
 
 	 	 	 	 / /   W R I T E   O U T   A   L I S T   O F   P E E R   N O D E S   A S   O P M L ,   R E C U R S I N G   W I T H   T H E I R   C H I L D R E N 
 	 	 	 	 f u n c t i o n   o p m l O u t l i n e ( l s t N e s t ,   s t r I n d e n t ,   b l n H i d d e n )   { 
 	 	 	 	 	 v a r   s t r O u t   =   ' ' , 
 	 	 	 	 	 	 s t r D e e p e r   =   s t r I n d e n t   +   '     ' , 
 	 	 	 	 	 	 b l n C o l l a p s e d   =   b l n H i d d e n , 
 	 	 	 	 	 	 d c t T a g s ,   l s t C h i l n ,   d c t N o d e ,   o C h i l d , 
 	 	 	 	 	 	 s t r K e y ; 
 
 	 	 	 	 	 f o r   ( v a r   i   =   0 ,   l n g   =   l s t N e s t . l e n g t h ;   i   <   l n g ;   i + + )   { 
 	 	 	 	 	 	 d c t N o d e   =   l s t N e s t [ i ] ; 
 	 	 	 	 	 	 / /   t e x t ,   o f f s e t   i n t o   s o u r c e   d o c ,   a n d   t y p e   o f   n o d e 
 	 	 	 	 	 	 s t r O u t   =   s t r O u t   +   s t r I n d e n t   +   s t r N o d e S t a r t   +   q u o t e A t t r ( d c t N o d e . t e x t )   +   ' " ' ; 
 	 	 	 	 	 	 s t r O u t   =   s t r O u t   +   '   p o s n = " '   +   d c t N o d e . p o s n   +   ' " ' ; 
 	 	 	 	 	 	 s t r O u t   =   s t r O u t   +   '   t y p e = " '   +   d c t N o d e . t y p e   +   ' " ' ; 
 
 	 	 	 	 	 	 / /   f u r t h e r   a t t r i b u t e s 
 	 	 	 	 	 	 d c t T a g s   =   d c t N o d e . t a g s ; 
 	 	 	 	 	 	 i f   ( d c t T a g s ) 
 	 	 	 	 	 	 	 f o r   ( s t r K e y   i n   d c t T a g s ) 
 	 	 	 	 	 	 	 	 s t r O u t   =   s t r O u t   +   '   '   +   s t r K e y   +   ' = " '   +   q u o t e A t t r ( d c t T a g s [ s t r K e y ] )   +   ' " ' ; 
 
 	 	 	 	 	 	 / /   r e c u r s e   w i t h   a n y   c h i l d r e n   b e f o r e   c l o s i n g   t h e   < o u t l i n e > 
 	 	 	 	 	 	 i f   ( d c t N o d e . n e s t )   { 
 	 	 	 	 	 	 	 i f   ( ! b l n H i d d e n   & &   ! d c t N o d e . f o l d ) 
 	 	 	 	 	 	 	 	 l s t F o l d s . p u s h ( i L i n e ) ;   / /   C o l l e c t   O P M L   E x p a n s i o n S t a t e   d i g i t 
 	 	 	 	 	 	 	 e l s e   b l n C o l l a p s e d   =   t r u e ; 
 	 	 	 	 	 	 	 i L i n e + + ;   / /   b e f o r e   t h e   r e c u r s i v e   d e s c e n t 
 
 	 	 	 	 	 	 	 s t r O u t   + =   s t r P a r e n t C l o s e ; 
 	 	 	 	 	 	 	 s t r O u t   + =   o p m l O u t l i n e ( d c t N o d e . n e s t ,   s t r D e e p e r ,   b l n C o l l a p s e d ) ; 
 	 	 	 	 	 	 	 s t r O u t   =   s t r O u t   +   s t r I n d e n t   +   s t r O u t l i n e C l o s e ; 
 	 	 	 	 	 	 }   e l s e   { 
 	 	 	 	 	 	 	 s t r O u t   + =   s t r L e a f C l o s e ; 
 	 	 	 	 	 	 	 i L i n e + + ; 
 	 	 	 	 	 	 } 
 
 	 	 	 	 	 } 
 	 	 	 	 	 r e t u r n   s t r O u t ; 
 	 	 	 	 } 
 
 
 	 	 	 	 / /   W A L K   T H R O U G H   T H E   T R E E ,   B U I L D I N G   A N   O P M L   O U T L I N E   S T R I N G 
 	 	 	 	 s t r O u t l i n e   =   o p m l O u t l i n e ( l s t R o o t s ,   '         ' ,   f a l s e ) ; 
 
 	 	 	 	 / /   A S S E M B L E   T H E   H E A D E R , 
 	 	 	 	 / /   I N C L U D I N G   T H E   E X P A N S I O N   D I G I T S   C O L L E C T E D   D U R I N G   R E C U R S I O N 
 	 	 	 	 s t r H e a d   =   s t r H e a d   +   l s t F o l d s . t o S t r i n g ( )   +   l s t O P M L P o s t E x p a n d . j o i n ( ' \ n ' ) ; 
 
 	 	 	 	 / /   A N D   C O M B I N E   H E A D   B O D Y   A N D   T A I L 
 	 	 	 	 s t r O P M L   =   [ s t r H e a d ,   s t r O u t l i n e ,   s t r T a i l ] . j o i n ( ' ' ) ; 
 	 	 	 	 / / s t r O P M L   =   s t r O u t l i n e ; 
 	 	 	 	 r e t u r n   s t r O P M L ; 
 	 	 	 } 
 
 	 	 	 f u n c t i o n   q u o t e A t t r ( s )   { 
 	 	 	 	 r e t u r n   ( ' '   +   s )   / *   F o r c e s   t h e   c o n v e r s i o n   t o   s t r i n g .   * / 
 	 	 	 	 	 . r e p l a c e ( / & / g ,   ' & a m p ; ' )   / *   T h i s   M U S T   b e   t h e   1 s t   r e p l a c e m e n t .   * / 
 	 	 	 	 	 . r e p l a c e ( / \ ' / g ,   ' & a p o s ; ' )   / *   T h e   4   o t h e r   p r e d e f i n e d   e n t i t i e s ,   r e q u i r e d .   * / 
 	 	 	 	 	 . r e p l a c e ( / \ " / g ,   ' & q u o t ; ' ) 
 	 	 	 	 	 . r e p l a c e ( / < / g ,   ' & l t ; ' ) 
 	 	 	 	 	 . r e p l a c e ( / > / g ,   ' & g t ; ' ) ; 
 	 	 	 } 
 
 	 	 	 / / / / / / / /   F T   M A I N 
 
 	 	 	 v a r   l s t R o o t s ,   l s t T e x t T r e e ; 
 
 	 	 	 / /   E X P O R T   W H O L E   D O C   ?   O R   J U S T   T H E   S E L E C T E D   L I N E ( S )   A N D   A L L   I T S / T H E I R   D E S C E N D A N T S   ? 
 	 	 	 i f   ( o p t i o n s . w h o l e d o c ) 
 	 	 	 	 l s t R o o t s   =   e d i t o r . t r e e ( ) . e v a l u a t e N o d e P a t h ( ' / @ t y p e ! = e m p t y ' ) ; 
 	 	 	 e l s e   l s t R o o t s   =   s e l e c t e d R o o t s ( ) ; 
 
 	 	 	 l s t T e x t T r e e   =   t e x t N e s t ( l s t R o o t s ,   { 
 	 	 	 	 t y p e :   ' r o o t ' 
 	 	 	 } ) ; 
 
 	 	 	 r e t u r n   o p m l T r a n s l a t i o n ( 
 	 	 	 	 l s t T e x t T r e e ,   q u o t e A t t r ( o p t i o n s . t i t l e ) 
 	 	 	 ) ; 
 	 	 } ; 
 
 	 / / / /   r u n ( )   F U N C T I O N ( S ) 
 	 f u n c t i o n   c h o o s e O u t P a t h ( o A p p ,   o D o c P a t h ,   s t r E x t n )   { 
 	 	 v a r   o F M   =   $ . N S F i l e M a n a g e r . d e f a u l t M a n a g e r , 
 	 	 	 p a t h L o c n   =   p O u t F o l d e r ,   / / m o d u l e   d e f a u l t 
 	 	 	 p a t h O u t   =   n u l l , 
 	 	 	 s t r N a m e   =   O b j C . u n w r a p ( o F M . d i s p l a y N a m e A t P a t h ( o D o c P a t h . t o S t r i n g ( ) ) ) , 
 	 	 	 l s t N a m e   =   s t r N a m e . s p l i t ( ' . ' ) , 
 	 	 	 l n g N a m e   =   l s t N a m e . l e n g t h , 
 	 	 	 l s t S t e m   =   l s t N a m e . s l i c e ( 0 ,   l n g N a m e   -   1 ) , 
 	 	 	 s t r S t e m   =   l s t N a m e [ 0 ] ; 
 
 	 	 i f   ( ! p a t h L o c n   | |   ! o F M . f i l e E x i s t s A t P a t h I s D i r e c t o r y ( p a t h L o c n . t o S t r i n g ( ) ,   n u l l ) ) 
 	 	 	 p a t h L o c n   =   o D o c P a t h ; 
 
 	 	 / /   d r a f t   n e w   n a m e   b y   s u b s t i t u t i n g   o r   a f f i x i n g   s t r E x t n 
 	 	 i f   ( 1   <   l n g N a m e )   { 
 	 	 	 l s t S t e m . p u s h ( s t r E x t n ) ; 
 	 	 	 s t r N a m e   =   l s t S t e m . j o i n ( ' . ' ) ; 
 	 	 }   e l s e   s t r N a m e   + =   ' . '   +   s t r E x t n ; 
 
 	 	 / /   s h o w   f i l e   n a m e   d i a l o g 
 	 	 o A p p . a c t i v a t e ( ) ; 
 	 	 p a t h O u t   =   o A p p . c h o o s e F i l e N a m e ( { 
 	 	 	 w i t h P r o m p t :   p T i t l e , 
 	 	 	 d e f a u l t N a m e :   s t r N a m e , 
 	 	 	 d e f a u l t L o c a t i o n :   p a t h L o c n 
 	 	 } ) ; 
 	 	 r e t u r n   [ p a t h O u t ,   s t r S t e m ] ; 
 	 } 
 
 	 / / / / / / / /   r u n ( )   M A I N 
 	 v a r   a p p F T   =   n e w   A p p l i c a t i o n ( " F o l d i n g T e x t " ) , 
 	 	 / / a p p S A = A p p l i c a t i o n . c u r r e n t A p p l i c a t i o n ( ) , 
 	 	 l s t D o c s   =   a p p F T . d o c u m e n t s ( ) , 
 	 	 o D o c   =   l s t D o c s . l e n g t h   ?   l s t D o c s [ 0 ]   :   n u l l , 
 	 	 f n P r o c e s s , 
 	 	 o P a t h , 
 	 	 s t r B a s e N a m e , 
 	 	 s t r F T P a t h ,   p a t h O M L   =   n u l l , 
 	 	 l s t P a t h S t e m   =   [ n u l l ,   n u l l ] , 
 	 	 p a t h O P M L   =   n u l l , 
 	 	 s t r O P M L , 
 	 	 n s O P M L   =   n u l l , 
 	 	 s t r O P M L P a t h   =   ' ' , 
 	 	 s t r M s g   =   ' ' ; 
 
 	 i f   ( o D o c )   { 
 	 	 a p p F T . a c t i v a t e ( ) ; 
 	 	 a p p F T . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 
 	 	 / /   P R O M P T   F O R   A N   E X P O R T   F I L E   P A T H 
 	 	 o P a t h   =   o D o c . f i l e ( ) ; 
 	 	 i f   ( o P a t h )   { 
 	 	 	 l s t P a t h S t e m   =   c h o o s e O u t P a t h ( a p p F T ,   o P a t h ,   ' o p m l ' ) ; 
 	 	 	 p a t h O P M L   =   l s t P a t h S t e m [ 0 ] ; 
 	 	 	 i f   ( p a t h O P M L )   { 
 
 	 	 	 	 f n P r o c e s s   =   ( p b l n D e b u g   ?   o D o c . d e b u g   :   o D o c . e v a l u a t e ) ; 
 
 	 	 	 	 s t r O P M L   =   f n P r o c e s s ( { 
 	 	 	 	 	 s c r i p t :   f n S c r i p t . t o S t r i n g ( ) , 
 	 	 	 	 	 w i t h O p t i o n s :   { 
 	 	 	 	 	 	 w h o l e d o c :   p b l n W h o l e D o c , 
 	 	 	 	 	 	 t i t l e :   o P a t h . t o S t r i n g ( )   / / l s t P a t h S t e m [ 1 ] 
 	 	 	 	 	 } 
 	 	 	 	 } ) ; 
 
 	 	 	 	 i f   ( s t r O P M L )   { 
 	 	 	 	 	 s t r O P M L P a t h   =   p a t h O P M L . t o S t r i n g ( ) ; 
 	 	 	 	 	 n s O P M L   =   $ . N S S t r i n g . a l l o c . i n i t W i t h U T F 8 S t r i n g ( s t r O P M L ) ; 
 	 	 	 	 	 n s O P M L . w r i t e T o F i l e A t o m i c a l l y ( s t r O P M L P a t h ,   t r u e ) ; 
 	 	 	 	 } 
 	 	 	 } 
 	 	 }   e l s e   s t r M s g   =   " S a v e   a c t i v e   f i l e   b e f o r e   e x p o r t i n g   t o   O P M L   . . . " ; 
 	 }   e l s e   s t r M s g   =   " N o   F o l d i n g T e x t   d o c u m e n t s   o p e n   . . . " ; 
 
 	 i f   ( s t r M s g )   { 
 	 	 v a r   a p p   =   A p p l i c a t i o n . c u r r e n t A p p l i c a t i o n ( ) ; 
 	 	 a p p . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 	 	 a p p . d i s p l a y D i a l o g ( s t r M s g ,   { 
 	 	 	 w i t h T i t l e :   [ p T i t l e ,   p V e r ] . j o i n ( ' \ t ' ) , 
 	 	 	 b u t t o n s :   [ " O K " ] , 
 	 	 	 d e f a u l t B u t t o n :   " O K " 
 	 	 } ) ; 
 	 	 r e t u r n   f a l s e ; 
 	 } 
 	 r e t u r n   " S a v e d   t o   "   +   s t r O P M L P a t h ; 
 }                              ?jjscr  ��ޭ