function gen_sampled_BPSK(data_size, sps)
    return cos.( (π/sps) * 0:data_size)
end