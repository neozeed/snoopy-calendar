      SUBROUTINE SNPPIC
C     THIS SUBROUTINE WILL ANALYZE THE INPUT DATA AND PRINT A PICTURE
C     YOU CAN EXPECT TO GET 1 WARNING MESSAGE DURING COMPILATION
      DIMENSION ILINE(133),INUM(50),ICHR(50)
      COMMON ISET
      DATA IBLNK/1H /
      DO 4 I=1,133
    4 ILINE(I)=IBLNK
    5 K=1
   10 READ (2,1000) (INUM(I),ICHR(I),I=1,ISET)
      DO 40 I=1,ISET
      IF (INUM(I) .NE. -1) GOTO 100
C     HERE WE WRITE A LINE TO THE PRINTER AND GO BUILD ANOTHER
      DO 15 L=K,133
   15 ILINE(L)=ICHR(I)
      WRITE (7,2000) (ILINE(K),K=1,133)
      ILINE(1)=IBLNK
      DO 20 K=2,133
   20 ILINE(K)=ICHR(I)
      K=1
C error      I=I+1
  100 IF (INUM(I) .EQ. -2) GOTO 200
      IF (INUM(I) .EQ. 0) GOTO 40
      DO 30 J=1,INUM(I)
      ILINE(K)=ICHR(I)
      K=K+1
   30 CONTINUE
   40 CONTINUE
      GOTO 10
C     HERE WE EXIT THE PICTURE AND RETURN TO THE CALLING PROGRAM
  200 RETURN
C     FORMAT STATEMENTS
 1000 FORMAT (25(I2,A1))
 2000 FORMAT (133A1)
      END
