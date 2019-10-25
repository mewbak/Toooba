//
// Generated by Bluespec Compiler, version 2019.05.beta1 (build b38abf678, 2019-05-06)
//
//
//
//
// Ports:
// Name                         I/O  size props
// pred_0_pred                    O     9
// RDY_pred_0_pred                O     1 const
// pred_1_pred                    O     9
// RDY_pred_1_pred                O     1 const
// RDY_update                     O     1 const
// RDY_flush                      O     1 const
// flush_done                     O     1 const
// RDY_flush_done                 O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// pred_0_pred_pc                 I    64
// pred_1_pred_pc                 I    64
// update_pc                      I    64
// update_taken                   I     1
// update_train                   I     8
// update_mispred                 I     1
// EN_update                      I     1
// EN_flush                       I     1 unused
// EN_pred_0_pred                 I     1
// EN_pred_1_pred                 I     1
//
// Combinational paths from inputs to outputs:
//   EN_pred_0_pred -> pred_1_pred
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkGSharePred(CLK,
		    RST_N,

		    pred_0_pred_pc,
		    EN_pred_0_pred,
		    pred_0_pred,
		    RDY_pred_0_pred,

		    pred_1_pred_pc,
		    EN_pred_1_pred,
		    pred_1_pred,
		    RDY_pred_1_pred,

		    update_pc,
		    update_taken,
		    update_train,
		    update_mispred,
		    EN_update,
		    RDY_update,

		    EN_flush,
		    RDY_flush,

		    flush_done,
		    RDY_flush_done);
  input  CLK;
  input  RST_N;

  // actionvalue method pred_0_pred
  input  [63 : 0] pred_0_pred_pc;
  input  EN_pred_0_pred;
  output [8 : 0] pred_0_pred;
  output RDY_pred_0_pred;

  // actionvalue method pred_1_pred
  input  [63 : 0] pred_1_pred_pc;
  input  EN_pred_1_pred;
  output [8 : 0] pred_1_pred;
  output RDY_pred_1_pred;

  // action method update
  input  [63 : 0] update_pc;
  input  update_taken;
  input  [7 : 0] update_train;
  input  update_mispred;
  input  EN_update;
  output RDY_update;

  // action method flush
  input  EN_flush;
  output RDY_flush;

  // value method flush_done
  output flush_done;
  output RDY_flush_done;

  // signals for module outputs
  wire [8 : 0] pred_0_pred, pred_1_pred;
  wire RDY_flush,
       RDY_flush_done,
       RDY_pred_0_pred,
       RDY_pred_1_pred,
       RDY_update,
       flush_done;

  // register predCnt_rl
  reg [1 : 0] predCnt_rl;
  wire [1 : 0] predCnt_rl$D_IN;
  wire predCnt_rl$EN;

  // register predRes_rl
  reg [1 : 0] predRes_rl;
  wire [1 : 0] predRes_rl$D_IN;
  wire predRes_rl$EN;

  // ports of submodule globalHist
  wire [7 : 0] globalHist$history, globalHist$redirect_newHist;
  wire [1 : 0] globalHist$addHistory_num, globalHist$addHistory_taken;
  wire globalHist$EN_addHistory, globalHist$EN_redirect;

  // ports of submodule predCnt_dummy2_0
  wire predCnt_dummy2_0$D_IN, predCnt_dummy2_0$EN, predCnt_dummy2_0$Q_OUT;

  // ports of submodule predCnt_dummy2_1
  wire predCnt_dummy2_1$D_IN, predCnt_dummy2_1$EN, predCnt_dummy2_1$Q_OUT;

  // ports of submodule predCnt_dummy2_2
  wire predCnt_dummy2_2$D_IN, predCnt_dummy2_2$EN, predCnt_dummy2_2$Q_OUT;

  // ports of submodule predRes_dummy2_0
  wire predRes_dummy2_0$D_IN, predRes_dummy2_0$EN, predRes_dummy2_0$Q_OUT;

  // ports of submodule predRes_dummy2_1
  wire predRes_dummy2_1$D_IN, predRes_dummy2_1$EN, predRes_dummy2_1$Q_OUT;

  // ports of submodule predRes_dummy2_2
  wire predRes_dummy2_2$D_IN, predRes_dummy2_2$EN, predRes_dummy2_2$Q_OUT;

  // ports of submodule tab
  wire [7 : 0] tab$ADDR_1,
	       tab$ADDR_2,
	       tab$ADDR_3,
	       tab$ADDR_4,
	       tab$ADDR_5,
	       tab$ADDR_IN;
  wire [1 : 0] tab$D_IN, tab$D_OUT_1, tab$D_OUT_2, tab$D_OUT_3;
  wire tab$WE;

  // rule scheduling signals
  wire CAN_FIRE_RL_canonGlobalHist,
       CAN_FIRE_RL_predCnt_canon,
       CAN_FIRE_RL_predRes_canon,
       CAN_FIRE_flush,
       CAN_FIRE_pred_0_pred,
       CAN_FIRE_pred_1_pred,
       CAN_FIRE_update,
       WILL_FIRE_RL_canonGlobalHist,
       WILL_FIRE_RL_predCnt_canon,
       WILL_FIRE_RL_predRes_canon,
       WILL_FIRE_flush,
       WILL_FIRE_pred_0_pred,
       WILL_FIRE_pred_1_pred,
       WILL_FIRE_update;

  // remaining internal signals
  wire [7 : 0] gHist__h4961, gHist__h5519;
  wire [1 : 0] IF_predCnt_lat_0_whas_THEN_predCnt_lat_0_wget__ETC___d8,
	       IF_predRes_lat_0_whas__5_THEN_predRes_lat_0_wg_ETC___d18,
	       n__read__h4984,
	       n__read__h5542,
	       res__h5165,
	       res__h5898,
	       upd__h3631,
	       upd__h3881,
	       upd__h5652,
	       upd__h6126,
	       x__h5220,
	       x__h5953,
	       y__h5428,
	       y__h6160;

  // actionvalue method pred_0_pred
  assign pred_0_pred = { tab$D_OUT_2[1], gHist__h4961 } ;
  assign RDY_pred_0_pred = 1'd1 ;
  assign CAN_FIRE_pred_0_pred = 1'd1 ;
  assign WILL_FIRE_pred_0_pred = EN_pred_0_pred ;

  // actionvalue method pred_1_pred
  assign pred_1_pred = { tab$D_OUT_1[1], gHist__h5519 } ;
  assign RDY_pred_1_pred = 1'd1 ;
  assign CAN_FIRE_pred_1_pred = 1'd1 ;
  assign WILL_FIRE_pred_1_pred = EN_pred_1_pred ;

  // action method update
  assign RDY_update = 1'd1 ;
  assign CAN_FIRE_update = 1'd1 ;
  assign WILL_FIRE_update = EN_update ;

  // action method flush
  assign RDY_flush = 1'd1 ;
  assign CAN_FIRE_flush = 1'd1 ;
  assign WILL_FIRE_flush = EN_flush ;

  // value method flush_done
  assign flush_done = 1'd1 ;
  assign RDY_flush_done = 1'd1 ;

  // submodule globalHist
  mkGShareGHistReg globalHist(.CLK(CLK),
			      .RST_N(RST_N),
			      .addHistory_num(globalHist$addHistory_num),
			      .addHistory_taken(globalHist$addHistory_taken),
			      .redirect_newHist(globalHist$redirect_newHist),
			      .EN_addHistory(globalHist$EN_addHistory),
			      .EN_redirect(globalHist$EN_redirect),
			      .history(globalHist$history),
			      .RDY_history(),
			      .RDY_addHistory(),
			      .RDY_redirect());

  // submodule predCnt_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) predCnt_dummy2_0(.CLK(CLK),
							   .D_IN(predCnt_dummy2_0$D_IN),
							   .EN(predCnt_dummy2_0$EN),
							   .Q_OUT(predCnt_dummy2_0$Q_OUT));

  // submodule predCnt_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) predCnt_dummy2_1(.CLK(CLK),
							   .D_IN(predCnt_dummy2_1$D_IN),
							   .EN(predCnt_dummy2_1$EN),
							   .Q_OUT(predCnt_dummy2_1$Q_OUT));

  // submodule predCnt_dummy2_2
  RevertReg #(.width(32'd1), .init(1'd1)) predCnt_dummy2_2(.CLK(CLK),
							   .D_IN(predCnt_dummy2_2$D_IN),
							   .EN(predCnt_dummy2_2$EN),
							   .Q_OUT(predCnt_dummy2_2$Q_OUT));

  // submodule predRes_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) predRes_dummy2_0(.CLK(CLK),
							   .D_IN(predRes_dummy2_0$D_IN),
							   .EN(predRes_dummy2_0$EN),
							   .Q_OUT(predRes_dummy2_0$Q_OUT));

  // submodule predRes_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) predRes_dummy2_1(.CLK(CLK),
							   .D_IN(predRes_dummy2_1$D_IN),
							   .EN(predRes_dummy2_1$EN),
							   .Q_OUT(predRes_dummy2_1$Q_OUT));

  // submodule predRes_dummy2_2
  RevertReg #(.width(32'd1), .init(1'd1)) predRes_dummy2_2(.CLK(CLK),
							   .D_IN(predRes_dummy2_2$D_IN),
							   .EN(predRes_dummy2_2$EN),
							   .Q_OUT(predRes_dummy2_2$Q_OUT));

  // submodule tab
  RegFile #(.addr_width(32'd8),
	    .data_width(32'd2),
	    .lo(8'd0),
	    .hi(8'd255)) tab(.CLK(CLK),
			     .ADDR_1(tab$ADDR_1),
			     .ADDR_2(tab$ADDR_2),
			     .ADDR_3(tab$ADDR_3),
			     .ADDR_4(tab$ADDR_4),
			     .ADDR_5(tab$ADDR_5),
			     .ADDR_IN(tab$ADDR_IN),
			     .D_IN(tab$D_IN),
			     .WE(tab$WE),
			     .D_OUT_1(tab$D_OUT_1),
			     .D_OUT_2(tab$D_OUT_2),
			     .D_OUT_3(tab$D_OUT_3),
			     .D_OUT_4(),
			     .D_OUT_5());

  // rule RL_canonGlobalHist
  assign CAN_FIRE_RL_canonGlobalHist = 1'd1 ;
  assign WILL_FIRE_RL_canonGlobalHist = 1'd1 ;

  // rule RL_predCnt_canon
  assign CAN_FIRE_RL_predCnt_canon = 1'd1 ;
  assign WILL_FIRE_RL_predCnt_canon = 1'd1 ;

  // rule RL_predRes_canon
  assign CAN_FIRE_RL_predRes_canon = 1'd1 ;
  assign WILL_FIRE_RL_predRes_canon = 1'd1 ;

  // register predCnt_rl
  assign predCnt_rl$D_IN = 2'd0 ;
  assign predCnt_rl$EN = 1'd1 ;

  // register predRes_rl
  assign predRes_rl$D_IN = 2'd0 ;
  assign predRes_rl$EN = 1'd1 ;

  // submodule globalHist
  assign globalHist$addHistory_num =
	     predCnt_dummy2_2$Q_OUT ?
	       (EN_pred_1_pred ?
		  upd__h3881 :
		  IF_predCnt_lat_0_whas_THEN_predCnt_lat_0_wget__ETC___d8) :
	       2'd0 ;
  assign globalHist$addHistory_taken =
	     predRes_dummy2_2$Q_OUT ?
	       (EN_pred_1_pred ?
		  upd__h3631 :
		  IF_predRes_lat_0_whas__5_THEN_predRes_lat_0_wg_ETC___d18) :
	       2'd0 ;
  assign globalHist$redirect_newHist = { update_taken, update_train[7:1] } ;
  assign globalHist$EN_addHistory = 1'd1 ;
  assign globalHist$EN_redirect = EN_update && update_mispred ;

  // submodule predCnt_dummy2_0
  assign predCnt_dummy2_0$D_IN = 1'd1 ;
  assign predCnt_dummy2_0$EN = EN_pred_0_pred ;

  // submodule predCnt_dummy2_1
  assign predCnt_dummy2_1$D_IN = 1'd1 ;
  assign predCnt_dummy2_1$EN = EN_pred_1_pred ;

  // submodule predCnt_dummy2_2
  assign predCnt_dummy2_2$D_IN = 1'd1 ;
  assign predCnt_dummy2_2$EN = 1'd1 ;

  // submodule predRes_dummy2_0
  assign predRes_dummy2_0$D_IN = 1'd1 ;
  assign predRes_dummy2_0$EN = EN_pred_0_pred ;

  // submodule predRes_dummy2_1
  assign predRes_dummy2_1$D_IN = 1'd1 ;
  assign predRes_dummy2_1$EN = EN_pred_1_pred ;

  // submodule predRes_dummy2_2
  assign predRes_dummy2_2$D_IN = 1'd1 ;
  assign predRes_dummy2_2$EN = 1'd1 ;

  // submodule tab
  assign tab$ADDR_1 = gHist__h5519 ^ pred_1_pred_pc[9:2] ;
  assign tab$ADDR_2 = gHist__h4961 ^ pred_0_pred_pc[9:2] ;
  assign tab$ADDR_3 = update_train ^ update_pc[9:2] ;
  assign tab$ADDR_4 = 8'h0 ;
  assign tab$ADDR_5 = 8'h0 ;
  assign tab$ADDR_IN = update_train ^ update_pc[9:2] ;
  assign tab$D_IN =
	     update_taken ?
	       ((tab$D_OUT_3 == 2'd3) ? tab$D_OUT_3 : tab$D_OUT_3 + 2'd1) :
	       ((tab$D_OUT_3 == 2'd0) ? tab$D_OUT_3 : tab$D_OUT_3 - 2'd1) ;
  assign tab$WE = EN_update ;

  // remaining internal signals
  assign IF_predCnt_lat_0_whas_THEN_predCnt_lat_0_wget__ETC___d8 =
	     EN_pred_0_pred ? upd__h5652 : predCnt_rl ;
  assign IF_predRes_lat_0_whas__5_THEN_predRes_lat_0_wg_ETC___d18 =
	     EN_pred_0_pred ? upd__h6126 : predRes_rl ;
  assign gHist__h4961 = globalHist$history >> n__read__h4984 ;
  assign gHist__h5519 = globalHist$history >> n__read__h5542 ;
  assign n__read__h4984 =
	     (predCnt_dummy2_0$Q_OUT && predCnt_dummy2_1$Q_OUT &&
	      predCnt_dummy2_2$Q_OUT) ?
	       predCnt_rl :
	       2'd0 ;
  assign n__read__h5542 =
	     (predCnt_dummy2_1$Q_OUT && predCnt_dummy2_2$Q_OUT) ?
	       IF_predCnt_lat_0_whas_THEN_predCnt_lat_0_wget__ETC___d8 :
	       2'd0 ;
  assign res__h5165 =
	     (predRes_dummy2_0$Q_OUT && predRes_dummy2_1$Q_OUT &&
	      predRes_dummy2_2$Q_OUT) ?
	       predRes_rl :
	       2'd0 ;
  assign res__h5898 =
	     (predRes_dummy2_1$Q_OUT && predRes_dummy2_2$Q_OUT) ?
	       IF_predRes_lat_0_whas__5_THEN_predRes_lat_0_wg_ETC___d18 :
	       2'd0 ;
  assign upd__h3631 =
	     tab$D_OUT_1[1] ? res__h5898 | x__h5953 : res__h5898 & y__h6160 ;
  assign upd__h3881 = n__read__h5542 + 2'd1 ;
  assign upd__h5652 = n__read__h4984 + 2'd1 ;
  assign upd__h6126 =
	     tab$D_OUT_2[1] ? res__h5165 | x__h5220 : res__h5165 & y__h5428 ;
  assign x__h5220 = 2'd1 << n__read__h4984 ;
  assign x__h5953 = 2'd1 << n__read__h5542 ;
  assign y__h5428 = ~x__h5220 ;
  assign y__h6160 = ~x__h5953 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        predCnt_rl <= `BSV_ASSIGNMENT_DELAY 2'd0;
	predRes_rl <= `BSV_ASSIGNMENT_DELAY 2'd0;
      end
    else
      begin
        if (predCnt_rl$EN)
	  predCnt_rl <= `BSV_ASSIGNMENT_DELAY predCnt_rl$D_IN;
	if (predRes_rl$EN)
	  predRes_rl <= `BSV_ASSIGNMENT_DELAY predRes_rl$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    predCnt_rl = 2'h2;
    predRes_rl = 2'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkGSharePred

