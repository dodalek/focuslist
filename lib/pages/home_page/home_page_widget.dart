import '/backend/supabase/supabase.dart';
import '/components/comp_nova_tarefa_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).roxo,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      safeSetState(() => _model.requestCompleter = null);
                      await _model.waitForRequestCompleted();
                    },
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 500.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: FlutterFlowCalendar(
                          color: const Color(0xFFF2F2F2),
                          iconColor: Colors.white,
                          weekFormat: true,
                          weekStartsMonday: false,
                          rowHeight: 64.0,
                          onChange: (DateTimeRange? newSelectedDate) async {
                            if (_model.calendarioSelectedDay ==
                                newSelectedDate) {
                              return;
                            }
                            _model.calendarioSelectedDay = newSelectedDate;
                            safeSetState(() => _model.requestCompleter = null);
                            await _model.waitForRequestCompleted();
                            safeSetState(() {});
                          },
                          titleStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                          dayOfWeekStyle:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          dateStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          selectedDateStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).roxo,
                                    letterSpacing: 0.0,
                                  ),
                          inactiveDateStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      constraints: const BoxConstraints(
                        maxWidth: 500.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            25.0, 16.0, 25.0, 25.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Tarefas do dia ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: FutureBuilder<List<TarefasListRow>>(
                                  future: (_model.requestCompleter ??=
                                          Completer<List<TarefasListRow>>()
                                            ..complete(
                                                TarefasListTable().queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'data',
                                                    supaSerialize<DateTime>(_model
                                                        .calendarioSelectedDay
                                                        ?.start),
                                                  )
                                                  .order('status',
                                                      ascending: true),
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<TarefasListRow>
                                        listViewTarefasListRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewTarefasListRowList.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 4.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewTarefasListRow =
                                            listViewTarefasListRowList[
                                                listViewIndex];
                                        return Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE8E2EE),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await TarefasListTable()
                                                        .update(
                                                      data: {
                                                        'status':
                                                            !listViewTarefasListRow
                                                                .status!,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eqOrNull(
                                                        'id',
                                                        listViewTarefasListRow
                                                            .id,
                                                      ),
                                                    );
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted();
                                                  },
                                                  child: Container(
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (listViewTarefasListRow
                                                                .status ??
                                                            true)
                                                          Icon(
                                                            Icons.check_box,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .roxo,
                                                            size: 24.0,
                                                          ),
                                                        if (!listViewTarefasListRow
                                                            .status!)
                                                          Icon(
                                                            Icons
                                                                .check_box_outline_blank,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .roxo,
                                                            size: 24.0,
                                                          ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      listViewTarefasListRow
                                                          .titulo,
                                                      'a',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await TarefasListTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows.eqOrNull(
                                                        'id',
                                                        listViewTarefasListRow
                                                            .id,
                                                      ),
                                                    );
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted();
                                                  },
                                                  child: Icon(
                                                    Icons
                                                        .restore_from_trash_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .roxo,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 4.0)),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () =>
                                          FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: CompNovaTarefaWidget(
                                          pmtData: _model
                                              .calendarioSelectedDay!.start,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                safeSetState(
                                    () => _model.requestCompleter = null);
                                await _model.waitForRequestCompleted();
                              },
                              text: 'Nova tarefa',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 45.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).roxo,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
