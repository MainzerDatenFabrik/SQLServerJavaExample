package pkg;

import com.microsoft.sqlserver.javalangextension.PrimitiveDataset;
import com.microsoft.sqlserver.javalangextension.AbstractSqlServerExtensionExecutor;

import java.sql.Types;
import java.util.LinkedHashMap;

public class HelloWorld extends AbstractSqlServerExtensionExecutor {

    public HelloWorld() {
        executorExtensionVersion = SQLSERVER_JAVA_LANG_EXTENSION_V1;
        executorInputDatasetClassName = PrimitiveDataset.class.getName();
        executorOutputDatasetClassName = PrimitiveDataset.class.getName();
    }

    public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {
        // Construct the output dataset
        PrimitiveDataset output = new PrimitiveDataset();
        output.addColumnMetadata(0, "Text", Types.NVARCHAR, 0, 0);
        output.addStringColumn(0, new String[]{"Hello World!"});
        return output;
    }
}