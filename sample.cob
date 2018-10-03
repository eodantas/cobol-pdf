       IDENTIFICATION DIVISION.
       PROGRAM-ID.    SAMPLE.
       AUTHOR.        EDGAR OLAVO.
       DATE-WRITTEN.  2018-10-03.
       SECURITY.      ********************
                      *  TEST COBOL-PDF  *
                      ********************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           COPY LIB/PDF.WSS.
           01 WIDX     PIC 9(03).
           01 WMASC    PIC ZZ9.99.
       LINKAGE SECTION.
       SCREEN SECTION.
       PROCEDURE DIVISION.
       MAKE-PDF.
           MOVE "cobol-pdf.pdf" TO PDF-FILE
           PERFORM PDF-ADD-PG
           MOVE "0800,N" TO PDF-FONT
           PERFORM PDF-SET-FONT
           PERFORM VARYING WIDX FROM 1 BY 1 UNTIL WIDX > 3
              MOVE "05000,00500,0   ,0,C,0" TO PDF-CELL
              MOVE " " TO PDF-CELL-TXT
              PERFORM PDF-DRAW-CELL
              MOVE "03000,00500,LB  ,0,C,0" TO PDF-CELL
              MOVE "1" TO PDF-CELL-TXT
              PERFORM PDF-DRAW-CELL
              MOVE "03000,00500,LB  ,0,C,0" TO PDF-CELL
              MOVE "2" TO PDF-CELL-TXT
              PERFORM PDF-DRAW-CELL
              MOVE "03000,00500,LBR ,1,C,0" TO PDF-CELL
              MOVE "3" TO PDF-CELL-TXT
              PERFORM PDF-DRAW-CELL
           END-PERFORM
           PERFORM PDF-END-DOC
           GO FIM.
       PDF-CABEC.
           MOVE "1000,B" TO PDF-FONT
           PERFORM PDF-SET-FONT
           MOVE "00000,00500,0   ,1,C,0" TO PDF-CELL
           MOVE 'PDF-COBOL' TO PDF-CELL-TXT
           PERFORM PDF-DRAW-CABEC
           SUBTRACT 4 FROM PDF-Y
           MOVE "00000,00500,0   ,1,R,0" TO PDF-CELL
           STRING
              "PAGE: " PDF-NUM-PAG(4:2)
           DELIMITED SIZE INTO PDF-CELL-TXT
           PERFORM PDF-DRAW-CABEC
           ADD 5 TO PDF-Y
           MOVE "0800,B" TO PDF-FONT
           PERFORM PDF-SET-FONT
           MOVE "05000,00500,0   ,0,C,0" TO PDF-CELL
           MOVE " " TO PDF-CELL-TXT
           PERFORM PDF-DRAW-CABEC
           MOVE "03000,00500,LTB ,0,C,0" TO PDF-CELL
           MOVE "FIELD 1" TO PDF-CELL-TXT
           PERFORM PDF-DRAW-CABEC
           MOVE "03000,00500,LTB ,0,C,0" TO PDF-CELL
           MOVE "FIELD 2" TO PDF-CELL-TXT
           PERFORM PDF-DRAW-CABEC
           MOVE "03000,00500,LTBR,1,C,0" TO PDF-CELL
           MOVE "FIELD 3" TO PDF-CELL-TXT
           PERFORM PDF-DRAW-CABEC.
       COPY LIB/PDF.PRD.
       FIM.
           EXIT.
