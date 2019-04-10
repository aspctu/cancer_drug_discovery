import java.io.*;

import hex.genmodel.easy.RowData;
import hex.genmodel.easy.EasyPredictModelWrapper;
import hex.genmodel.easy.prediction.*;

public class Main {
  private static String modelClassName = "gbm_pojo_test";

  public static void main(String[] args) throws Exception {
    hex.genmodel.GenModel rawModel;
    rawModel = (hex.genmodel.GenModel) Class.forName(modelClassName).newInstance();
    EasyPredictModelWrapper model = new EasyPredictModelWrapper(rawModel);

    RowData row = new RowData();

    row.put("x1", "COMPOSITE LYMPHOMA");
    row.put("bday", -14812);
    row.put("Gender", 1);
    row.put("Stage", "1A");
    row.put("bad", 1);
    row.put("perf", 0);
    row.put("Ldh", 0.661904762);
    row.put("size", 6);
    row.put("IPI", 0);
    row.put("drug", "CHOP3-RADIATION");
    row.put("stem", "YES");
    
    
    BinomialModelPrediction p = model.predictBinomial(row);
    System.out.println("Label (aka prediction) is flight departure delayed: " + p.label);
    System.out.print("Class probabilities: ");
    for (int i = 0; i < p.classProbabilities.length; i++) {
      if (i > 0) {
        System.out.print(",");
      }
      System.out.print(p.classProbabilities[i]);
    }
    System.out.println("");
  }
}