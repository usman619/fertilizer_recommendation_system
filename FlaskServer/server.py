import pickle
import numpy as np
from flask import Flask, request, jsonify

app = Flask(__name__)

# Feature names used during training
feature_names = ['N', 'P', 'K', 'temp', 'humidity', 'ph', 'rainfall']

@app.route('/api', methods=['POST'])
def model():
    try:
        # Extract JSON data from the request
        json_data = request.get_json()

        # Convert JSON data to dictionary
        converted_obj = {key: value for key, value in json_data.items()}
        print(converted_obj)

        # Validate key names
        for key in converted_obj.keys():
            if key not in feature_names:
                return jsonify({'error': f'Invalid key: {key}'}), 400

        # Convert string values to float-precision numbers
        for key, value in converted_obj.items():
            try:
                converted_obj[key] = float(value)
            except ValueError:
                return jsonify({'error': f'Invalid value for key {key}: {value}'}), 400
        
        print('convert to float', converted_obj)

        # Check value ranges
        for key, value in converted_obj.items():
            if key in ['N', 'P', 'K']:
                if value < 0:
                    return jsonify({'error': f'Value for key {key} must be non-negative'}), 400
            elif key == 'temp':
                if value < -20 or value > 50:
                    return jsonify({'error': f'Value for key temp must be between -20 and 50'}), 400
            elif key in ['humidity', 'rainfall']:
                if value < 0:
                    return jsonify({'error': f'Value for key {key} must be non-negative'}), 400
            elif key == 'ph':
                if value < 4 or value > 10:
                    return jsonify({'error': f'Value for key ph must be between 4 and 10'}), 400

        # Convert dictionary to numpy array
        features = np.array([converted_obj[key] for key in feature_names], dtype=float)

        # Reshape the array to be a 2D array with a single row
        features = features.reshape(1, -1)

        # Loading the model (keep this part unchanged)
        with open('/home/usman619/Downloads/FlaskServer/models/DecisionTree.pkl', 'rb') as file:
            loaded_model = pickle.load(file)

        # Make a prediction
        prediction = loaded_model.predict(features)
        print(f'Prediction: {prediction}')

        # Convert the prediction result to a dictionary
        result = {'prediction': prediction[0]}

        return jsonify(result)

    except ValueError as ve:
        print(f"Error: {str(ve)}")
        print(f"Problematic data: {json_data}")
        return jsonify({'error': str(ve)}), 500  # Return a 500 Internal Server Error status

    except Exception as e:
        print(f"Error: {str(e)}")
        return jsonify({'error': str(e)}), 500  # Return a 500 Internal Server Error status

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)




# import pickle
# import numpy as np
# from flask import Flask, request, jsonify

# app = Flask(__name__)

# # Feature names used during training
# feature_names = ['N', 'P', 'K', 'temp', 'humidity', 'ph', 'rainfall']

# @app.route('/api', methods=['POST'])
# def model():
#     try:
#         # Extract JSON data from the request
#         json_data = request.get_json()

#         # Convert JSON data to dictionary
#         converted_obj = {key: value for key, value in json_data.items()}

#         # Validate key names
#         for key in converted_obj.keys():
#             if key not in feature_names:
#                 return jsonify({'error': f'Invalid key: {key}'}), 400

#         # Convert string values to float-precision numbers
#         for key, value in converted_obj.items():
#             try:
#                 converted_obj[key] = float(value)
#             except ValueError:
#                 return jsonify({'error': f'Invalid value for key {key}: {value}'}), 400

#         # Check value ranges
#         for key, value in converted_obj.items():
#             if key in ['N', 'P', 'K']:
#                 if value < 0:
#                     return jsonify({'error': f'Value for key {key} must be non-negative'}), 400
#             elif key == 'temp':
#                 if value < -20 or value > 50:
#                     return jsonify({'error': f'Value for key temp must be between -20 and 50'}), 400
#             elif key in ['humidity', 'rainfall']:
#                 if value < 0:
#                     return jsonify({'error': f'Value for key {key} must be non-negative'}), 400
#             elif key == 'ph':
#                 if value < 4 or value > 10:
#                     return jsonify({'error': f'Value for key ph must be between 4 and 10'}), 400

#         # Normalize data if necessary (e.g., min-max scaling)


        

#         # Convert dictionary to numpy array
#         features = np.array([converted_obj[key] for key in feature_names], dtype=float)

#         # Reshape the array to be a 2D array with a single row
#         features = features.reshape(1, -1)

#         # Loading the model (keep this part unchanged)
#         with open('/home/usman619/Downloads/FlaskServer/models/DecisionTree.pkl', 'rb') as file:
#             loaded_model = pickle.load(file)

#         # Make a prediction
#         prediction = loaded_model.predict([features])
#         print(f'Prediction: {prediction}')

#         # Convert the prediction result to a dictionary
#         result = {'prediction': (prediction[0])}

#         return jsonify(result)

#     except ValueError as ve:
#         print(f"Error: {str(ve)}")
#         print(f"Problematic data: {json_data}")
#         return jsonify({'error': str(ve)}), 500  # Return a 500 Internal Server Error status

#     except Exception as e:
#         print(f"Error: {str(e)}")
#         return jsonify({'error': str(e)}), 500  # Return a 500 Internal Server Error status

# if __name__ == '__main__':
#     app.run(host='0.0.0.0', port=5000)





















# import pickle
# import numpy as np
# from flask import Flask, request, jsonify

# app = Flask(__name__)

# # Feature names used during training
# feature_names = ['N', 'P', 'K', 'temp', 'humidity', 'ph', 'rainfall']

# @app.route('/api', methods=['POST','GET'])
# def model():
#     try:
#         # Extract JSON data from the request
#         json_data = request.get_json()

#         # Convert string values to double-precision floating-point numbers
#         converted_obj = {key: float(value) for key, value in json_data.items()}

#         print(converted_obj)

#         # Loading the model (keep this part unchanged)
#         with open('/home/usman619/Downloads/FlaskServer/models/DecisionTree.pkl', 'rb') as file:
#             loaded_model = pickle.load(file)

#         # Assuming the JSON keys match the features expected by the model
#         # features = [
#         #     float(converted_obj.get('N', 0)),
#         #     float(converted_obj.get('P', 0)),
#         #     float(converted_obj.get('K', 0)),
#         #     float(converted_obj.get('temp', 0)),
#         #     float(converted_obj.get('humidity', 0)),
#         #     float(converted_obj.get('ph', 0)),
#         #     float(converted_obj.get('rainfall', 0))
#         # ]
#         features = np.array([
#             converted_obj.get('N', 0),
#             converted_obj.get('P', 0),
#             converted_obj.get('K', 0),
#             converted_obj.get('temp', 0),
#             converted_obj.get('humidity', 0),
#             converted_obj.get('ph', 0),
#             converted_obj.get('rainfall', 0)
#         ], dtype=float)

#         # Reshape the array to be a 2D array with a single row
#         features = features.reshape(1, -1)

#         # Make a prediction
#         # prediction = loaded_model.predict([features])
#         prediction = loaded_model.predict([[90,42,43,20.8,80,6.5,202.9]])
#         print('Prediction:',prediction)

#         # Convert the prediction result to a dictionary
#         result = {'prediction': (prediction[0])}

#         return jsonify(result)

#     except ValueError as ve:
#         print(f"Error: {str(ve)}")
#         print(f"Problematic data: {json_data}")
#         return jsonify({'error': str(ve)}), 500  # Return a 500 Internal Server Error status

#     except Exception as e:
#         print(f"Error: {str(e)}")
#         return jsonify({'error': str(e)}), 500  # Return a 500 Internal Server Error status

# if __name__ == '__main__':
#     app.run(host='0.0.0.0', port=5000)


















# import pickle
# from sklearn.metrics import classification_report
# from sklearn import metrics
# from sklearn import tree

# from sklearn.tree import DecisionTreeClassifier

# from flask import Flask, request, jsonify

# app = Flask(__name__)

# @app.route('/api', methods = ['GET'])
# def model():
#     d = {}
#     # Loading the model
#     with open('model.pkl', 'rb') as file:
#         loaded_model = pickle.load(file)
    
#     prediction = loaded_model.predict([[83, 45, 60, 28, 70.3, 7.0, 150.9]])

#     # Evaluate the performance
#     # accuracy = accuracy_score(, prediction)
#     # print(f'Accuracy: {accuracy}')

#     # d = {}
#     # d['Query'] = str(request.args['Query'])
#     return jsonify(d)



# if __name__ == '__main__':
#     app.run(host='0.0.0.0')

# {
#     'N': '5',
#     'P': '5',
#     'K': '5',
#     'temp': '20.6',
#     'pH': '5.5',
#     'rainfall': '200.3'
# }