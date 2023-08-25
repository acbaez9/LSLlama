export PYTORCH_CUDA_ALLOC_CONF="max_split_size_mb:216"
export TORCH_EXTENSIONS_DIR="/nobackup/users/acbaez/LSLlama/torch-extensions"
export CXX=g++

torchrun --nproc_per_node=4 train.py \
    --model_name_or_path "./llama-7b-hf" \
    --data_path "./train/lex.mturk.txt" \
    --fp16 True \
    --output_dir "./tuned-llama-7b" \
    --num_train_epochs 4 \
    --per_device_train_batch_size 4 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 8 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 2000 \
    --save_total_limit 1 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --deepspeed "./configs/llama_modified.json" \
    
