namespace QFT {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Arithmetic;

    @EntryPoint()
    operation QFTcircuit() : Unit {
        //(1) QuantumCircuit erstellen
        use  (q0, q1, q2) = (Qubit(), Qubit(), Qubit()) {
        //(2) initieren mit 110 = 6 als Beispiel
           X(q0);
           X(q1);

        //(3 + 4) automatische Subroutine mit BigEndian als Type für Qubit-Einheit
           QFT(BigEndian([q0, q1, q2]));

        //(5) Messen und Ergebnisse ausgeben
          let result_q0 = M(q0);
          let result_q1 = M(q1);
          let result_q2 = M(q2);
            Message($"q0: {result_q0}, q1: {result_q1}, q2: {result_q2} (ist random)");
        }
    }
}
