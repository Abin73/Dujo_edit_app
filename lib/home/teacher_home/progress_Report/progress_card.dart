// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/widget/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/progress_report/progress_report_model.dart';

class StudentProgressReportScreen extends StatefulWidget {
  var schooilID;
  var classID;
  var studentImage;
  var studentName;
  var rollNo;
  var dob;
  var parentName;
  var gurdianNAme;
  var examName;
  var studentId;
  var teacherid;
  StudentProgressReportScreen(
      {required this.schooilID,
      required this.classID,
      required this.studentImage,
      required this.studentName,
      required this.rollNo,
      required this.dob,
      required this.parentName,
      required this.gurdianNAme,
      required this.examName,
      required this.studentId,
      required this.teacherid,
      super.key});

  @override
  State<StudentProgressReportScreen> createState() =>
      _StudentProgressReportScreenState();
}

class _StudentProgressReportScreenState
    extends State<StudentProgressReportScreen> {
  String schoolName = '';
  String schoolPlace = "";
  @override
  void initState() {
    getSchoolDetails();
    super.initState();
  }

  Widget build(BuildContext context) {
    log(widget.studentImage);
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                schoolName,
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                schoolPlace,
                style: const TextStyle(
                    letterSpacing: 5,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                widget.examName,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 05.h,
              ),
              Text(
                "Progress Report",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.studentName,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.studentImage),
                    radius: 60,
                  ),
                ],
              ),
              Container(
                height: 110,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Text("Roll No :  "),
                          Text(widget.rollNo),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Class :   ${widget.classID}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Parent :   ${widget.parentName}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Gurdian :   ${widget.gurdianNAme}"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("SchoolListCollection")
                      .doc(widget.schooilID)
                      .collection("Classes")
                      .doc(widget.classID)
                      .collection("Subjects")
                      .snapshots(),
                  builder: (context, snapshot) {
                    List<TextEditingController> _obtainedcontrollers =
                        List.generate(
                      snapshot.data!.docs.length,
                      (index) => TextEditingController(),
                    );
                    List<TextEditingController> _totalMarkController =
                        List.generate(
                      snapshot.data!.docs.length,
                      (index) => TextEditingController(),
                    );
                    log('${snapshot.data!.docs.length}');
                    return Container(
                      color: Colors.amber,
                      height: 600,
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            child: DataTable(
                              columns: const [
                                DataColumn(
                                  label: Text('No'),
                                ),
                                DataColumn(
                                  label: Text("Subjects"),
                                ),
                                DataColumn(
                                  label: Text('Obtained'),
                                ),
                                DataColumn(
                                  label: Text('Total'),
                                ),
                              ],
                              rows: [
                                for (int i = 0;
                                    i <= snapshot.data!.docs.length - 1;
                                    i++)
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Text('${i + 1}'),
                                      ),
                                      DataCell(
                                        Text(
                                          '${snapshot.data!.docs[i].data()['subject']}',
                                        ),
                                      ),
                                      DataCell(TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _obtainedcontrollers[i],
                                      )),
                                      DataCell(TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: _totalMarkController[i])),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              List<ExamReports> _examReports = [];
                              for (int j = 0;
                                  j < snapshot.data!.docs.length - 1;
                                  j++) {
                                double _obtainedMarks = double.parse(
                                    _obtainedcontrollers[j].text.trim());
                                double _totalMarks = double.parse(
                                    _totalMarkController[j].text.trim());

                                _examReports.add(ExamReports(
                                    obtainedMark: _obtainedMarks,
                                    subject: snapshot.data!.docs[j]
                                        .data()['subject'],
                                    totalMark: _totalMarks));
                              }

                              UploadProgressReportModel _subjectReport =
                                  UploadProgressReportModel(
                                studentIMage: widget.studentImage,
                                schoolName: schoolName,
                                schoolPlace: schoolPlace,
                                teacherName: widget.teacherid,
                                id: widget.examName,
                                whichExam: widget.examName,
                                publishDate: DateTime.now().toString(),
                                studentName: widget.studentName,
                                rollNo: widget.rollNo,
                                wClass: widget.classID,
                                reports: _examReports,
                              );
                              AddProgressReportStatusToFireBase()
                                  .addAProgressReportController(

                                      _subjectReport,
                                      context,
                                      widget.schooilID,
                                      widget.classID,
                                      widget.studentId,
                                      widget.examName
                                      )
                                  .then((value) => {
                                        showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Message'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text('Records Updated'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('ok'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      });
                            },
                            child: ButtonContainerWidget(
                                colorindex: 0,
                                curving: 10,
                                height: 40,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                  ),
                                )),
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      )),
    );
  }

  void getSchoolDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schooilID)
        .get();
    setState(() {
      schoolName = vari.data()!['schoolName'];
      schoolPlace = vari.data()!['place'];
    });
  }
}
