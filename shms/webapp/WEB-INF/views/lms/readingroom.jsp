<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
<!-- contents start -->
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">HOME</a></li>
        <li class="breadcrumb-item"><a href="#">편의시설</a></li>
        <li class="breadcrumb-item active" aria-current="page">도서관 열람실 예약</li>
    </ol>
</nav>

<section class="section">
    <div class="card">
        <div class="card-body">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active tabBtn" id="seatWrap1-tab" data-bs-toggle="tab" href="#seatWrap1"
                        role="tab" aria-controls="seatWrap1" aria-selected="false">1열람실</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link tabBtn" id="seatWrap2-tab" data-bs-toggle="tab" href="#seatWrap2"
                        role="tab" aria-controls="seatWrap2" aria-selected="true">2열람실</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link tabBtn" id="mySeat-tab" data-bs-toggle="tab" href="#mySeat"
                        role="tab" aria-controls="mySeat" aria-selected="true">예약내역</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade seat show active" id="seatWrap1" role="tabpanel" aria-labelledby="seatWrap1-tab">
                    <div class="row">
                        <div class="col-lg-9" id="seat1">
                            <!-- seat 출력 -->
                          <div class="text-center front"><strong>출입문</strong></div>
                          <table class="seatTable">
                              <tr>
                                  <td class="rent">1</td>
                                  <td>2</td>
                                  <td>3</td>
                                  <td>4</td>
                                  <td>5</td>
                                  <td>6</td>
                                  <td>7</td>
                                  <td>8</td>
                                  <td>9</td>
                                  <td>10</td>
                              </tr>
                              <tr>
                                  <td>11</td>
                                  <td>12</td>
                                  <td>13</td>
                                  <td class="rent">14</td>
                                  <td>15</td>
                                  <td class="rent">16</td>
                                  <td>17</td>
                                  <td>18</td>
                                  <td>19</td>
                                  <td>20</td>
                              </tr>
                              <tr>
                                  <td class="rent">21</td>
                                  <td>22</td>
                                  <td>23</td>
                                  <td>24</td>
                                  <td>25</td>
                                  <td>26</td>
                                  <td>27</td>
                                  <td>28</td>
                                  <td>29</td>
                                  <td>30</td>
                              </tr>
                              <tr>
                                  <td>31</td>
                                  <td>32</td>
                                  <td>33</td>
                                  <td class="rent">34</td>
                                  <td>35</td>
                                  <td class="rent">36</td>
                                  <td>37</td>
                                  <td>38</td>
                                  <td>39</td>
                                  <td>40</td>
                              </tr>
                              <tr>
                                  <td class="rent">41</td>
                                  <td>42</td>
                                  <td>43</td>
                                  <td>44</td>
                                  <td>45</td>
                                  <td>46</td>
                                  <td>47</td>
                                  <td>48</td>
                                  <td>49</td>
                                  <td>50</td>
                              </tr>
                              <tr>
                                  <td>51</td>
                                  <td>52</td>
                                  <td>53</td>
                                  <td class="rent">54</td>
                                  <td>55</td>
                                  <td class="rent">56</td>
                                  <td>57</td>
                                  <td>58</td>
                                  <td>59</td>
                                  <td>60</td>
                              </tr>
                              <tr>
                                  <td>61</td>
                                  <td>62</td>
                                  <td>63</td>
                                  <td>64</td>
                                  <td class="rent">65</td>
                                  <td>66</td>
                                  <td>67</td>
                                  <td>68</td>
                                  <td>69</td>
                                  <td>60</td>
                              </tr>
                              <tr>
                                  <td>71</td>
                                  <td>72</td>
                                  <td>73</td>
                                  <td>74</td>
                                  <td>75</td>
                                  <td>76</td>
                                  <td>77</td>
                                  <td>78</td>
                                  <td>79</td>
                                  <td>80</td>
                              </tr>
                              <tr>
                                  <td>81</td>
                                  <td>82</td>
                                  <td>83</td>
                                  <td>84</td>
                                  <td>85</td>
                                  <td>86</td>
                                  <td>87</td>
                                  <td>88</td>
                                  <td>89</td>
                                  <td>90</td>
                              </tr>
                              <tr>
                                  <td>91</td>
                                  <td>92</td>
                                  <td>93</td>
                                  <td>94</td>
                                  <td>95</td>
                                  <td>96</td>
                                  <td>97</td>
                                  <td>98</td>
                                  <td>99</td>
                                  <td>100</td>
                              </tr>
                          </table>
                      </div>
                      <div class="col-lg-3 choiceWrap">
                          <p style="margin: 10px 0;">※ 열람실은 당일 예약만 가능합니다.</p>
                          <form class="choiceBox">
                              <h5>열람실 예약</h5>
                              <ul class="seatInfo">
                                  <li><strong>학번 </strong>S10101001</li>
                                  <li><strong>이름 </strong>박초원</li>
                                  <li><strong>열람실 </strong>1열람실</li>
                                  <li><strong>좌석 </strong> <span class="seatNum"></span></li>
                                  <li><strong>예약일 </strong>2021.05.28</li>
                              </ul>
                              <div>
                                  <button type="button" class="btn btn-primary block rentBtn" style="width: 100%;"
                                      data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
                                      좌석예약
                                  </button>
                              </div>
                              <ul class="seatStat">
                                  <li>
                                      <span class="nomal"></span>
                                      <span>예약가능</span>
                                  </li>
                                  <li>
                                      <span class="rent"></span>
                                      <span>예약불가</span>
                                  </li>
                                  <li>
                                      <span class="choice"></span>
                                      <span>선택좌석</span>
                                  </li>
                              </ul>
                          </form>
                      </div>
                  </div>
              </div>
              <div class="tab-pane fade row seat" id="seatWrap2" role="seatWrap2" aria-labelledby="seatWrap2-tab">
                  <div class="row">
                      <div class="col-lg-9" id="seat1">
                          <!-- seat 출력 -->
                          <div class="text-center front"><strong>출입문</strong></div>
                          <table class="seatTable">
                              <tr>
                                  <td class="rent">A1</td>
                                  <td>A2</td>
                                  <td>A3</td>
                                  <td>A4</td>
                                  <td>A5</td>
                                  <td>A6</td>
                                  <td>A7</td>
                                  <td>A8</td>
                                  <td>A9</td>
                                  <td>A10</td>
                              </tr>
                              <tr>
                                  <td>11</td>
                                  <td>12</td>
                                  <td>13</td>
                                  <td class="rent">14</td>
                                  <td>15</td>
                                  <td class="rent">16</td>
                                  <td>17</td>
                                  <td>18</td>
                                  <td>19</td>
                                  <td>20</td>
                              </tr>
                              <tr>
                                  <td class="rent">21</td>
                                  <td>22</td>
                                  <td>23</td>
                                  <td>24</td>
                                  <td>25</td>
                                  <td>26</td>
                                  <td>27</td>
                                  <td>28</td>
                                  <td>29</td>
                                  <td>30</td>
                              </tr>
                              <tr>
                                  <td>31</td>
                                  <td>32</td>
                                  <td>33</td>
                                  <td class="rent">34</td>
                                  <td>35</td>
                                  <td class="rent">36</td>
                                  <td>37</td>
                                  <td>38</td>
                                  <td>39</td>
                                  <td>40</td>
                              </tr>
                              <tr>
                                  <td class="rent">41</td>
                                  <td>42</td>
                                  <td>43</td>
                                  <td>44</td>
                                  <td>45</td>
                                  <td>46</td>
                                  <td>47</td>
                                  <td>48</td>
                                  <td>49</td>
                                  <td>50</td>
                              </tr>
                              <tr>
                                  <td>51</td>
                                  <td>52</td>
                                  <td>53</td>
                                  <td class="rent">54</td>
                                  <td>55</td>
                                  <td class="rent">56</td>
                                  <td>57</td>
                                  <td>58</td>
                                  <td>59</td>
                                  <td>60</td>
                              </tr>
                              <tr>
                                  <td>61</td>
                                  <td>62</td>
                                  <td>63</td>
                                  <td>64</td>
                                  <td class="rent">65</td>
                                  <td>66</td>
                                  <td>67</td>
                                  <td>68</td>
                                  <td>69</td>
                                  <td>60</td>
                              </tr>
                              <tr>
                                  <td>71</td>
                                  <td>72</td>
                                  <td>73</td>
                                  <td>74</td>
                                  <td>75</td>
                                  <td>76</td>
                                  <td>77</td>
                                  <td>78</td>
                                  <td>79</td>
                                  <td>80</td>
                              </tr>
                              <tr>
                                  <td>81</td>
                                  <td>82</td>
                                  <td>83</td>
                                  <td>84</td>
                                  <td>85</td>
                                  <td>86</td>
                                  <td>87</td>
                                  <td>88</td>
                                  <td>89</td>
                                  <td>90</td>
                              </tr>
                              <tr>
                                  <td>91</td>
                                  <td>92</td>
                                  <td>93</td>
                                  <td>94</td>
                                  <td>95</td>
                                  <td>96</td>
                                  <td>97</td>
                                  <td>98</td>
                                  <td>99</td>
                                  <td>100</td>
                              </tr>
                          </table>
                      </div>
                      <div class="col-lg-3 choiceWrap">
                          <p style="margin: 10px 0;">※ 열람실은 당일 예약만 가능합니다.</p>
                          <form class="choiceBox">
                              <h5>열람실 예약</h5>
                              <ul class="seatInfo">
                                  <li><strong>학번 </strong>S10101001</li>
                                  <li><strong>이름 </strong>박초원</li>
                                  <li><strong>열람실 </strong>2열람실</li>
                                  <li><strong>좌석 </strong> <span class="seatNum"></span></li>
                                  <li><strong>예약일 </strong>2021.05.28</li>
                              </ul>
                              <div>
                                  <button type="button" class="btn btn-primary block rentBtn" style="width: 100%;"
                                      data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
                                      좌석예약
                                  </button>
                              </div>
                              <ul class="seatStat">
                                  <li>
                                      <span class="nomal"></span>
                                      <span>예약가능</span>
                                  </li>
                                  <li>
                                      <span class="rent"></span>
                                      <span>예약불가</span>
                                  </li>
                                  <li>
                                      <span class="choice"></span>
                                      <span>선택좌석</span>
                                  </li>
                              </ul>
                          </form>
                      </div>
                  </div>
              </div>
              <div class="tab-pane fade row seat" id="mySeat" role="mySeat" aria-labelledby="mySeat-tab">
                  <section class="section">
                      <div class="card">
                          <div class="card-body">
                              <div class="row">
                                  <div class="col-lg-4">
                                      <!-- 예약한 좌석이 있을때 -->
                                      <div class="roomQr" id="roomQrBlock">
                                          <img src="${cPath}/resources/lms/assets/images/qr.jpg" />
                                          <p class="text-center">입구에 비치된 카메라에<br/>QR코드 인식 후 입실해야 합니다.</p>
                                      </div>
                                      <!-- 예약한 좌석이 없을때 -->
                                        <div class="roomQr text-center" id="roomQrNone">
                                            <img src="${cPath}/resources/lms/vendors/images/logo_black.png" />
                                            <p class="text-center">예약한 열람실 좌석이 없습니다.</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <table class="table table-striped" id="table1">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">No.</th>
                                                    <th class="text-center">예약번호</th>
                                                    <th class="text-center">좌석번호</th>
                                                    <th class="text-center">예약일</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-center">1</td>
                                                    <td class="text-center">1231415</td>
                                                    <td class="text-center">1열람실 38번</td>
                                                    <td class="text-center">2021.05.25</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">1</td>
                                                    <td class="text-center">1231415</td>
                                                    <td class="text-center">1열람실 38번</td>
                                                    <td class="text-center">2021.05.25</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">1</td>
                                                    <td class="text-center">1231415</td>
                                                    <td class="text-center">1열람실 38번</td>
                                                    <td class="text-center">2021.05.25</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">1</td>
                                                    <td class="text-center">1231415</td>
                                                    <td class="text-center">1열람실 38번</td>
                                                    <td class="text-center">2021.05.25</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
           
        </div>
    </div>
</section>    

<!-- 모달 -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">
                    도서관 열람실 예약
                </h5>
                <button type="button" class="close" data-bs-dismiss="modal"
                    aria-label="Close">
                    <i data-feather="x"></i>
                </button>
            </div>
            <div class="modal-body">
                <p>
                    도서관 열람실 예약이 완료되었습니다.<br/>
                    예약한 좌석은 본인만 사용할 수 있습니다.
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"
                    data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">닫기</span>
                </button>
            </div>
        </div>
    </div>
</div>
<!-- contents end -->
</div>
<script>
    $(function(){
        $(".seat").find("table").on("click", "td", function(){
            $(".seat").find("table td").removeClass("choice");
            $(this).addClass("choice");
            var num = $(this).text();

            $(".choiceWrap").find(".seatNum").text(num + "번");
        });

        $(".tabBtn").on("click", function(){
            $(".seat").find("table td").removeClass("choice");
            $(".choiceWrap").find(".seatNum").text("");
        });

        $(".rentBtn").on("click", function(){
            if($(".choiceWrap").find(".seatNum").text() == null || $(".choiceWrap").find(".seatNum").text() == ""){
                $("#exampleModalCenter").find(".modal-body p").text("선택하신 좌석이 없습니다.");
                $(".choiceBox").reset();
            }else {
                $("#exampleModalCenter").addClass("show");
            }
        });
    });
</script>
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>
