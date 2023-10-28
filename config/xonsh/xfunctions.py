def ssh_c3_mbp():
    ssh lefv@192.168.8.131

def grade_mp2(CRANFIELD_NDCG_10: float):
    ap_ndgc = 0.1 / 0.39662969347959043
    return 0.1 * AP_NDCG_10 + 0.3 * CRANFIELD_NDCG_10 + 0.6 * FACULTY_NDCG_10
