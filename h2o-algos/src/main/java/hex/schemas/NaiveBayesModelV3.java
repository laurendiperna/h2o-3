package hex.schemas;

import hex.naivebayes.NaiveBayesModel;
import water.api.API;
import water.api.ModelOutputSchema;
import water.api.ModelSchema;
import water.api.TwoDimTableBase;

public class NaiveBayesModelV3 extends ModelSchema<NaiveBayesModel, NaiveBayesModelV3, NaiveBayesModel.NaiveBayesParameters, NaiveBayesV3.NaiveBayesParametersV3, NaiveBayesModel.NaiveBayesOutput, NaiveBayesModelV3.NaiveBayesModelOutputV3> {
  public static final class NaiveBayesModelOutputV3 extends ModelOutputSchema<NaiveBayesModel.NaiveBayesOutput, NaiveBayesModelOutputV3> {
    // Output fields; input fields are in the parameters list
    @API(help = "Categorical levels of the response")
    public String[] levels;

    @API(help = "A-priori probabilities of the response")
    public TwoDimTableBase apriori;

    @API(help = "Conditional probabilities of the predictors")
    public TwoDimTableBase[] pcond;
  }

  // TODO: I think we can implement the following two in ModelSchema, using reflection on the type parameters.
  public NaiveBayesV3.NaiveBayesParametersV3 createParametersSchema() { return new NaiveBayesV3.NaiveBayesParametersV3(); }
  public NaiveBayesModelOutputV3 createOutputSchema() { return new NaiveBayesModelOutputV3(); }

  // Version&Schema-specific filling into the impl
  @Override public NaiveBayesModel createImpl() {
    NaiveBayesModel.NaiveBayesParameters parms = parameters.createImpl();
    return new NaiveBayesModel( model_id.key(), parms, null );
  }
}
