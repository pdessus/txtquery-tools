FasdUAS 1.101.10   ��   ��    k             j     �� �� 0 ptitle pTitle  m        � 	 	 N R e g i s t e r   a n d   h a n d l e   f t d o c : / /   u r l   s c h e m e   
  
 j    �� �� 0 pver pVer  m       �    0 . 0 4      j    �� �� 0 pauthor pAuthor  m       �    R o b   T r e w      j   	 �� �� 0 pdescription pDescription  m   	 
   �  : 
 
 	 U s e   i n   c o n j u n c t i o n   w i t h   t h e   ' F T C o p y A s U R L '   A p p l e s c r i p t   t o   g e t 
 	 a   U R L   w h i c h   o p e n s   t h e   s p e c i f i e d   d o c u m e n t ,   o p t i o n a l l y   r e s t o r i n g   s e l e c t i o n   a n d   f i l t e r   s t a t e . 
 
      l     ��������  ��  ��        l     ��  ��    Q K Registers the url-scheme ftdoc://encoded-file-path with optional switches:     �   �   R e g i s t e r s   t h e   u r l - s c h e m e   f t d o c : / / e n c o d e d - f i l e - p a t h   w i t h   o p t i o n a l   s w i t c h e s :     !   l     �� " #��   " ; 5[?nodepath=//@due] -- nodepath used to apply a filter    # � $ $ j [ ? n o d e p a t h = / / @ d u e ]   - -   n o d e p a t h   u s e d   t o   a p p l y   a   f i l t e r !  % & % l     �� ' (��   ' : 4[?selnpath=] -- nodepath used to specify a selection    ( � ) ) h [ ? s e l n p a t h = ]   - -   n o d e p a t h   u s e d   t o   s p e c i f y   a   s e l e c t i o n &  * + * l     �� , -��   , % [?find=] -- text string to find    - � . . > [ ? f i n d = ]   - -   t e x t   s t r i n g   t o   f i n d +  / 0 / l     �� 1 2��   1 . ([?line=N][?startoffset=0][?endoffset=-1]    2 � 3 3 P [ ? l i n e = N ] [ ? s t a r t o f f s e t = 0 ] [ ? e n d o f f s e t = - 1 ] 0  4 5 4 l     ��������  ��  ��   5  6 7 6 l     �� 8 9��   8 1 + where line is zero-based and defaults to 0    9 � : : V   w h e r e   l i n e   i s   z e r o - b a s e d   a n d   d e f a u l t s   t o   0 7  ; < ; l     �� = >��   = T N startoffset is an offset of a number of characters from the start of the line    > � ? ? �   s t a r t o f f s e t   i s   a n   o f f s e t   o f   a   n u m b e r   o f   c h a r a c t e r s   f r o m   t h e   s t a r t   o f   t h e   l i n e <  @ A @ l     �� B C��   B   endoffset is ditto    C � D D &   e n d o f f s e t   i s   d i t t o A  E F E l     ��������  ��  ��   F  G H G l     �� I J��   I 5 / and the url opens the document in FoldingText:    J � K K ^   a n d   t h e   u r l   o p e n s   t h e   d o c u m e n t   i n   F o l d i n g T e x t : H  L M L l     �� N O��   N = 7 1. Applying any specified ?nodepath= value as a filter    O � P P n   1 .   A p p l y i n g   a n y   s p e c i f i e d   ? n o d e p a t h =   v a l u e   a s   a   f i l t e r M  Q R Q l     �� S T��   S H B 2. Selecting the first line that matches (in the following order)    T � U U �   2 .   S e l e c t i n g   t h e   f i r s t   l i n e   t h a t   m a t c h e s   ( i n   t h e   f o l l o w i n g   o r d e r ) R  V W V l     �� X Y��   X 2 ,	--	the value of ?selnpath= ?find= or ?line=    Y � Z Z X 	 - - 	 t h e   v a l u e   o f   ? s e l n p a t h =   ? f i n d =   o r   ? l i n e = W  [ \ [ l     �� ] ^��   ] o i 3. Restricts the selection to a subset of a line selected by number if startoffset > 0 or endoffset � -1    ^ � _ _ �   3 .   R e s t r i c t s   t h e   s e l e c t i o n   t o   a   s u b s e t   o f   a   l i n e   s e l e c t e d   b y   n u m b e r   i f   s t a r t o f f s e t   >   0   o r   e n d o f f s e t  "`   - 1 \  ` a ` l     ��������  ��  ��   a  b c b l     �� d e��   d o i for the approach to registering and handling a url with an applescript.app and the .plist in its bundle,    e � f f �   f o r   t h e   a p p r o a c h   t o   r e g i s t e r i n g   a n d   h a n d l i n g   a   u r l   w i t h   a n   a p p l e s c r i p t . a p p   a n d   t h e   . p l i s t   i n   i t s   b u n d l e , c  g h g l     �� i j��   i C = see http://www.macosxautomation.com/applescript/linktrigger/    j � k k z   s e e   h t t p : / / w w w . m a c o s x a u t o m a t i o n . c o m / a p p l e s c r i p t / l i n k t r i g g e r / h  l m l l     ��������  ��  ��   m  n o n j    �� p�� 0 
pinodepath 
piNodePath p m    ����  o  q r q j    �� s�� 0 
piselnpath 
piSelnPath s m    ����  r  t u t j    �� v�� 0 
pifindtext 
piFindText v m    ����  u  w x w j    �� y�� 0 piline piLine y m    ����  x  z { z j    �� |�� 0 pistartoffset piStartOffset | m    ����  {  } ~ } j    �� �� 0 piendoffset piEndOffset  m    ����  ~  � � � l     ��������  ��  ��   �  � � � j    3�� ��� 0 plstkeys plstKeys � J    2 � �  � � � m    ! � � � � �  n o d e p a t h �  � � � m   ! $ � � � � �  s e l n p a t h �  � � � m   $ ' � � � � �  f i n d �  � � � m   ' * � � � � �  l i n e �  � � � m   * - � � � � �  s t a r t o f f s e t �  ��� � m   - 0 � � � � �  e n d o f f s e t��   �  � � � j   4 ;�� ��� 0 plngkeys plngKeys � n   4 : � � � 1   5 9��
�� 
leng � o   4 5���� 0 plstkeys plstKeys �  � � � l     ��������  ��  ��   �  � � � j   < @�� ��� 0 	pjsselect 	pjsSelect � m   < ? � � � � �� 
 
 f u n c t i o n ( e d i t o r ,   o p t i o n s )   { 
 	 f u n c t i o n   g e t V a l u e ( s t r S w i t c h )   { 
 	 	 r e t u r n   l s t S w i t c h e s [ l s t S w i t c h e s . i n d e x O f ( ' ? '   +   s t r S w i t c h   +   ' = ' ) + 1 ] ; 
 	 } 
 	 
 	 v a r 	 t r e e =   e d i t o r . t r e e ( ) , 
 	 	 o N o d e ,   r n g S e l n , 
 	 	 / / o p t i o n s . f i l e p a t h ,   o p t i o n s . s w i t c h e s ,   o p t i o n s . k e y s 
 	 	 l s t K e y s   =   o p t i o n s . k e y s , 
 	 	 s t r R e g e x   =   ' ( \ \ ? '   +   l s t K e y s . j o i n ( ' = | \ \ ? ' )   +   ' = ) ' , 
 	 	 o R e g e x   =   n e w   R e g E x p ( s t r R e g e x ,   ' g ' ) , 
 	 	 s t r P a t h   =   d e c o d e U R I C o m p o n e n t ( o p t i o n s . f i l e p a t h ) ,   
 	 	 s t r S w i t c h e s   =   d e c o d e U R I C o m p o n e n t ( o p t i o n s . s w i t c h e s ) , 
 	 	 l s t S w i t c h e s   =   s t r S w i t c h e s . s p l i t ( o R e g e x ) , 
 	 	 s t r P a t h ,   s t r L i n e N u m , 
 	 	 s t r S e l n P a t h , 
 	 	 s t r F i n d , 
 	 	 s t r S t a r t O f f s e t ,   s t r E n d O f f s e t , 
 	 	 l n g L i n e ,   l n g S t a r t O f f s e t = 0 ,   l n g E n d O f f s e t = - 1 , 
 	 	 v a r S t a r t O f f s e t ,   v a r E n d O f f s e t , 
 	 	 l s t M a t c h e s = [ ] ,   l s t R a n g e s = [ ] ,   i ; 
 	 	 
 	 
 	 / /   T r y   t o   r e s t o r e   a n y   s e l e c t i o n   t h a t   i s   s p e c i f i e d 
 	 i f   ( s t r P a t h   =   g e t V a l u e ( ' n o d e p a t h ' ) )   { 
 	 	 / / r e s t o r e   a n y   f i l t e r 
 	 	 e d i t o r . s e t N o d e P a t h ( s t r P a t h ) ; 
 	 } 
 	 	 
 	 
 	 s t r S e l n P a t h   =   g e t V a l u e ( ' s e l n p a t h ' ) ; 
 	 s t r F i n d   =   g e t V a l u e ( ' f i n d ' ) ; 
 	 
 	 i f   ( s t r S e l n P a t h   | |   s t r F i n d )   { 
 	 	 i f   ( s t r S e l n P a t h )   { 
 	 	 	 l s t M a t c h e s   =   t r e e . e v a l u a t e N o d e P a t h ( s t r S e l n P a t h ) ; 
 	 	 } 
 	 	 i f   ( s t r F i n d   & &   ( l s t M a t c h e s . l e n g t h   = =   0 ) )   { 
 	 	 	 l s t M a t c h e s   =   t r e e . e v a l u a t e N o d e P a t h ( ' / / " '   +   s t r F i n d   +   ' " ' ) ; 
 	 	 } 
 	 	 i f   ( l s t M a t c h e s . l e n g t h )   { 
 	 	 	 l s t M a t c h e s . f o r E a c h ( f u n c t i o n ( v a r N o d e )   { 
 	 	 	 	 l s t R a n g e s . p u s h ( t r e e . c r e a t e R a n g e F r o m N o d e s ( 
 	 	 	 	 	 v a r N o d e ,   0 ,   v a r N o d e ,   - 1 ) ) ; 
 	 	 	 	 / /   u n f o l d   i f   t h i s   r a n g e   i s   h i d d e n 
 	 	 	 	 i f   ( e d i t o r . n o d e I s H i d d e n I n F o l d ( v a r N o d e ) )   { 
 	 	 	 	 	 e d i t o r . e x p a n d T o R e v e a l N o d e ( v a r N o d e ) ; 
 	 	 	 	 } 
 	 	 	 } ) ; 
 	 	 	 e d i t o r . s e t S e l e c t e d R a n g e s ( l s t R a n g e s ) ; 
 	 	 	 / / M a k e   s u r e   t h a t   a t   l e a s t   t h e   f i r s t   o f   a n y   s e l e c t i o n s   i s   v i s i b l e 
 	 	 	 e d i t o r . s c r o l l R a n g e T o V i s i b l e ( l s t R a n g e s [ 0 ] ) ; 
 	 	 } 
 	 }   e l s e   { 
 	 	 
 	 	 / /   m a k e   a n y   s e l e c t i o n   s p e c i f i e d   b y   l i n e   n u m b e r   e t c 
 	 	 i f   ( s t r L i n e   =   g e t V a l u e ( ' l i n e ' ) )   { 
 	 	 	 l n g L i n e   =   p a r s e I n t ( s t r L i n e ,   1 0 ) ; 
 	 	 	 i f   ( ! ( i s N a N ( l n g L i n e ) ) )   { 
 	 	 	 	 o N o d e   =   t r e e . l i n e N u m b e r T o N o d e ( l n g L i n e ) ; 
 	 	 	 	 i f   ( e d i t o r . n o d e I s H i d d e n I n F o l d ( o N o d e ) )   { 
 	 	 	 	 	 e d i t o r . e x p a n d T o R e v e a l N o d e ( o N o d e ) ; 
 	 	 	 	 	 e d i t o r . s c r o l l T o L i n e ( l n g L i n e ) ; 
 	 	 	 	 } 
 	 	 
 	 	 	 	 i f   ( s t r S t a r t O f f s e t   =   g e t V a l u e ( ' s t a r t o f f s e t ' ) )   { 
 	 	 	 	 	 v a r S t a r t O f f s e t   =   p a r s e I n t ( s t r S t a r t O f f s e t ,   1 0 ) ; 
 	 	 	 	 	 i f   ( ! i s N a N ( v a r S t a r t O f f s e t ) )   { 
 	 	 	 	 	 	 l n g S t a r t O f f s e t   =   v a r S t a r t O f f s e t ; 
 	 	 	 	 	 } 
 	 	 	 	 } 
 	 	 
 	 	 	 	 i f   ( s t r E n d O f f s e t   =   g e t V a l u e ( ' e n d o f f s e t ' ) )   { 
 	 	 	 	 	 v a r E n d O f f s e t   =   p a r s e I n t ( s t r E n d O f f s e t ,   1 0 ) ; 
 	 	 	 	 	 i f   ( ! i s N a N ( v a r E n d O f f s e t ) )   { 
 	 	 	 	 	 	 l n g E n d O f f s e t   =   v a r E n d O f f s e t ; 
 	 	 	 	 	 } 
 	 	 	 	 } 
 
 	 	 	 	 r n g S e l n   =   t r e e . c r e a t e R a n g e F r o m N o d e s ( 
 	 	 	 	 	 o N o d e ,   l n g S t a r t O f f s e t ,   o N o d e ,   l n g E n d O f f s e t ) ; 
 	 	 	 	 e d i t o r . s e t S e l e c t e d R a n g e ( r n g S e l n ) ; 
 	 	 	 } 
 	 	 } 
 	 } 
 } 
 �  � � � l     ��������  ��  ��   �  � � � i   A D � � � I     �� ���
�� .GURLGURLnull��� ��� TEXT � o      ���� 0 strurl strURL��   � k     N � �  � � � r      � � � I     �� ����� "0 pathandswitches pathAndSwitches �  ��� � o    ���� 0 strurl strURL��  ��   � o      ���� 0 recparse recParse �  ��� � Z   	 N � ����� � >  	  � � � o   	 
���� 0 recparse recParse � m   
 ��
�� 
msng � k    J � �  � � � r     � � � I    �� ����� 0 decode Decode �  ��� � n     � � � o    ���� 0 filepath   � o    ���� 0 recparse recParse��  ��   � o      ���� 0 strpath strPath �  � � � l   ��������  ��  ��   �  ��� � O    J � � � k    I � �  � � � r    % � � � l   # ����� � I   #�� ���
�� .aevtodocnull  �    alis � o    ���� 0 strpath strPath��  ��  ��   � o      ���� 0 odoc oDoc �  ��� � O   & I � � � k   * H � �  � � � r   * B � � � l  * @ ����� � I  * @���� �
�� .FTsuevjSnull���     docu��   � �� � �
�� 
FTjs � o   , 1���� 0 	pjsselect 	pjsSelect � �� ���
�� 
FTop � l  2 < ����� � b   2 < � � � o   2 3���� 0 recparse recParse � K   3 ; � � �� ����� 0 keys   � o   4 9���� 0 plstkeys plstKeys��  ��  ��  ��  ��  ��   � o      ���� 0 	varresult 	varResult �  ��� � I  C H������
�� .miscactvnull��� ��� null��  ��  ��   � o   & '���� 0 odoc oDoc��   � m     � ��                                                                                      @ alis    `  Macintosh HD               �9�SH+  P0FoldingText.app                                                ��m��>�        ����  	                Applications    �9�S      ��0�    P0  *Macintosh HD:Applications: FoldingText.app     F o l d i n g T e x t . a p p    M a c i n t o s h   H D  Applications/FoldingText.app  / ��  ��  ��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i   E H � � � I      �� ����� 0 decode Decode �  ��� � o      ����  0 strencodedpath strEncodedPath��  ��   � k      � �  � � � r      � � � b      � � � b      � � � m      � � � � � � J S C = / S y s t e m / L i b r a r y / F r a m e w o r k s / J a v a S c r i p t C o r e . f r a m e w o r k / V e r s i o n s / A / R e s o u r c e s / j s c 
 " $ J S C "   - e   " p r i n t ( d e c o d e U R I ( ' � o    ����  0 strencodedpath strEncodedPath � m     � � � � � 
 ' ) ) ; " � o      ���� 0 strcmd strCMD �  ��� � L     � � I   �� ���
�� .sysoexecTEXT���     TEXT � o    	���� 0 strcmd strCMD��  ��   �  � � � l     ��������  ��  ��   �  �  � i   I L I      ��~� "0 pathandswitches pathAndSwitches �} o      �|�| 0 strurl strURL�}  �~   k     �  l     �{	�{   C = we can't simply split on '?' as there may be '?' in the text   	 �

 z   w e   c a n ' t   s i m p l y   s p l i t   o n   ' ? '   a s   t h e r e   m a y   b e   ' ? '   i n   t h e   t e x t  l     �z�z   D > extracting the file in .js would require an active document,     � |   e x t r a c t i n g   t h e   f i l e   i n   . j s   w o u l d   r e q u i r e   a n   a c t i v e   d o c u m e n t ,    l     �y�y   O I so we do it here to save the time and distraction caused by creating one    � �   s o   w e   d o   i t   h e r e   t o   s a v e   t h e   t i m e   a n d   d i s t r a c t i o n   c a u s e d   b y   c r e a t i n g   o n e  r      m      �   o      �x�x 0 strswitches strSwitches  r     J    
  !  n   "#" 1    �w
�w 
txdl#  f    ! $�v$ m    %% �&&  f t d o c : / /�v   J      '' ()( o      �u�u 0 dlm  ) *�t* n     +,+ 1    �s
�s 
txdl,  f    �t   -.- r    !/0/ n    121 2   �r
�r 
citm2 o    �q�q 0 strurl strURL0 o      �p�p 0 lstparts lstParts. 343 Z   " �56�o75 A   " '898 n   " %:;: 1   # %�n
�n 
leng; o   " #�m�m 0 lstparts lstParts9 m   % &�l�l 6 r   * -<=< m   * +�k
�k 
msng= o      �j�j 0 varparse varParse�o  7 k   0 �>> ?@? r   0 6ABA n   0 4CDC 4   1 4�iE
�i 
cobjE m   2 3�h�h D o   0 1�g�g 0 lstparts lstPartsB o      �f�f 0 	strtarget 	strTarget@ FGF r   7 <HIH n   7 :JKJ 1   8 :�e
�e 
lengK o   7 8�d�d 0 	strtarget 	strTargetI o      �c�c 0 lngfull lngFullG LML r   = @NON o   = >�b�b 0 lngfull lngFullO o      �a�a 0 
lngclosest 
lngClosestM PQP X   A �R�`SR k   U �TT UVU r   U ^WXW l  U ZY�_�^Y b   U ZZ[Z b   U X\]\ m   U V^^ �__  ?] o   V W�]�] 0 varkey varKey[ m   X Y`` �aa  =�_  �^  X n     bcb 1   [ ]�\
�\ 
txdlc  f   Z [V ded r   _ dfgf n   _ bhih 2  ` b�[
�[ 
citmi o   _ `�Z�Z 0 	strtarget 	strTargetg o      �Y�Y 0 lstparts lstPartse j�Xj Z   e �kl�W�Vk ?   e jmnm n   e hopo 1   f h�U
�U 
lengp o   e f�T�T 0 lstparts lstPartsn m   h i�S�S l k   m �qq rsr r   m utut n   m svwv 1   q s�R
�R 
lengw n   m qxyx 4   n q�Qz
�Q 
cobjz m   o p�P�P y o   m n�O�O 0 lstparts lstPartsu o      �N�N 0 lngposn lngPosns {�M{ Z  v �|}�L�K| A   v y~~ o   v w�J�J 0 lngposn lngPosn o   w x�I�I 0 
lngclosest 
lngClosest} r   | ��� o   | }�H�H 0 lngposn lngPosn� o      �G�G 0 
lngclosest 
lngClosest�L  �K  �M  �W  �V  �X  �` 0 varkey varKeyS o   D I�F�F 0 plstkeys plstKeysQ ��� r   � ���� n   � ���� 7  � ��E��
�E 
ctxt� m   � ��D�D � o   � ��C�C 0 
lngclosest 
lngClosest� o   � ��B�B 0 	strtarget 	strTarget� o      �A�A 0 strpath strPath� ��� Z   � ����@�?� A   � ���� o   � ��>�> 0 
lngclosest 
lngClosest� o   � ��=�= 0 lngfull lngFull� r   � ���� n   � ���� 7  � ��<��
�< 
ctxt� l  � ���;�:� [   � ���� o   � ��9�9 0 
lngclosest 
lngClosest� m   � ��8�8 �;  �:  � m   � ��7�7��� o   � ��6�6 0 	strtarget 	strTarget� o      �5�5 0 strswitches strSwitches�@  �?  � ��4� r   � ���� K   � ��� �3���3 0 filepath  � o   � ��2�2 0 strpath strPath� �1��0�1 0 switches  � o   � ��/�/ 0 strswitches strSwitches�0  � o      �.�. 0 varparse varParse�4  4 ��� r   � ���� o   � ��-�- 0 dlm  � n     ��� 1   � ��,
�, 
txdl�  f   � �� ��+� L   � ��� o   � ��*�* 0 varparse varParse�+    ��� l     �)�(�'�)  �(  �'  � ��� l     �&�%�$�&  �%  �$  � ��� l     �#���#  � ^ X-- "ftdoc://encoded-file-path[?nodepath=//@due][?line=N][?startoffset=0][?endoffset=-1]"   � ��� � - -   " f t d o c : / / e n c o d e d - f i l e - p a t h [ ? n o d e p a t h = / / @ d u e ] [ ? l i n e = N ] [ ? s t a r t o f f s e t = 0 ] [ ? e n d o f f s e t = - 1 ] "� ��� l     �"�!� �"  �!  �   � ��� l     ����  �  �  �       ��    �������� �����  � ����������
�	������ 0 ptitle pTitle� 0 pver pVer� 0 pauthor pAuthor� 0 pdescription pDescription� 0 
pinodepath 
piNodePath� 0 
piselnpath 
piSelnPath� 0 
pifindtext 
piFindText� 0 piline piLine� 0 pistartoffset piStartOffset�
 0 piendoffset piEndOffset�	 0 plstkeys plstKeys� 0 plngkeys plngKeys� 0 	pjsselect 	pjsSelect
� .GURLGURLnull��� ��� TEXT� 0 decode Decode� "0 pathandswitches pathAndSwitches� � � � � � � ��� �   � � � � � �� � � ��� ����
� .GURLGURLnull��� ��� TEXT� 0 strurl strURL�   � ������������ 0 strurl strURL�� 0 recparse recParse�� 0 strpath strPath�� 0 odoc oDoc�� 0 	varresult 	varResult� �������� ����������������� "0 pathandswitches pathAndSwitches
�� 
msng�� 0 filepath  �� 0 decode Decode
�� .aevtodocnull  �    alis
�� 
FTjs
�� 
FTop�� 0 keys  �� 
�� .FTsuevjSnull���     docu
�� .miscactvnull��� ��� null�� O*�k+  E�O�� @*��,k+ E�O� -�j E�O�  *�b  ��b  
l%� 
E�O*j UUY h� �� ����������� 0 decode Decode�� ����� �  ����  0 strencodedpath strEncodedPath��  � ������  0 strencodedpath strEncodedPath�� 0 strcmd strCMD�  � ���
�� .sysoexecTEXT���     TEXT�� �%�%E�O�j � ������������ "0 pathandswitches pathAndSwitches�� ����� �  ���� 0 strurl strURL��  � ������������������������ 0 strurl strURL�� 0 strswitches strSwitches�� 0 dlm  �� 0 lstparts lstParts�� 0 varparse varParse�� 0 	strtarget 	strTarget�� 0 lngfull lngFull�� 0 
lngclosest 
lngClosest�� 0 varkey varKey�� 0 lngposn lngPosn�� 0 strpath strPath� ��%������������^`��������
�� 
txdl
�� 
cobj
�� 
citm
�� 
leng
�� 
msng
�� 
kocl
�� .corecnte****       ****
�� 
ctxt�� 0 filepath  �� 0 switches  �� �� ��E�O)�,�lvE[�k/E�Z[�l/)�,FZO��-E�O��,l �E�Y ���l/E�O��,E�O�E�O Jb  
[��l kh �%�%)�,FO��-E�O��,k ��k/�,E�O�� �E�Y hY h[OY��O�[�\[Zk\Z�2E�O�� �[�\[Z�k\Zi2E�Y hO����E�O�)�,FO�ascr  ��ޭ