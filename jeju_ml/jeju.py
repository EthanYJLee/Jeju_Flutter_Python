"""
Create on 2023-02-24
Author: youngjin
Description: Flutter, Python AI 예측값 보내기
"""

from flask import Flask, jsonify, request
import joblib
import pandas as pd
import numpy as np

app = Flask(__name__)

@app.route("/jeju")
def jeju():
    dong = request.args.get("dong")
    category = request.args.get("category")
    local = request.args.get("local")
    chinese = request.args.get("chinese")
    # intMonth = int(request.args.get("month"))

    # 국내 관광객, 중국인 유동인구 DataFrame
    visits = pd.DataFrame(np.array([[local, chinese]]))

    # month = pd.DataFrame(np.array([[intMonth]]))

    # 행정동 One-Hot Encoding
    dong_list = ['건입동', '구좌읍', '남원읍', '노형동', '대륜동', '대정읍', '대천동', '도두동', '동홍동', '봉개동', '삼도이동',
                 '삼도일동', '삼양동', '서홍동', '성산읍', '송산동', '아라동', '안덕면', '애월읍', '연동', '영천동', '예래동',
                 '오라동', '외도동', '용담이동', '용담일동', '우도면', '이도이동', '이도일동', '이호동', '일도이동', '일도일동', '정방동',
                 '조천읍', '중문동', '중앙동', '천지동', '추자면', '표선면', '한경면', '한림읍', '화북동', '효돈동']
    dong_index = dong_list.index(dong)
    dong_onehot = [
        [0 if i != dong_index else 1 for i in range(len(dong_list))]]
    dong_onehot = pd.DataFrame(dong_onehot)

    # 업종 One-Hot Encoding
    category_list = ['양식', '외국음식', '음료', '일식', '중식', '패스트푸드', '한식']
    category_index = category_list.index(category)
    category_onehot = [
        [0 if i != category_index else 1 for i in range(len(category_list))]]
    category_onehot = pd.DataFrame(category_onehot)

    # Feature DataFrame 생성 (병합)
    # feature = pd.concat([visits, month, dong_onehot, category_onehot], axis=1)
    feature = pd.concat([visits, dong_onehot, category_onehot], axis=1)
    

    print(feature)

    # 행정동별 업종별 매장수 csv
    res_counts = pd.read_csv("./jeju_ml/res_counts.csv")
    count = res_counts[(res_counts['읍면동명']==dong)&(res_counts['업종명']==category)]['매장수'].values[0]

    rf = joblib.load("./jeju_ml/rf_jeju.h5")
    pre = rf.predict(feature.to_numpy())

    if(count!=0):
        re = float(pre[0])/float(count)
    else:
        count = 1
        re = float(pre[0])/float(count)
    
    result = "{:.2f}".format(re)

    return jsonify({'result': str(result)})
    

# host_add = 'localhost'
host_add = '127.0.0.1'
port_num = 5000

if __name__ == "__main__":
    # app.run(host="localhost", port=5000, debug=True)
    app.run(host=host_add, port=port_num, debug=True)
